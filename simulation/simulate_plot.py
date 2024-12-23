#!/usr/bin/env python3
#Script by Eric to simulate with real data, get simulator output and plot it

import sys, os, json, subprocess
from vcd.reader import TokenKind, tokenize
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime, timedelta

class LuSEE_Integrated_Simulator:
    def __init__(self, config_file, log_file):
        print("Python --> Welcome to the LuSEE Integrated Simulator")
        with open(config_file, "r") as jsonfile:
            self.json_data = json.load(jsonfile)

        self.signals_of_interest = {}
        for num,i in enumerate(self.json_data["Signals"]):
            listing = {}
            listing['Title'] = self.json_data["Signals"][i]['Title']
            listing['Y-axis'] = self.json_data["Signals"][i]['Y-axis']
            listing['Signedness'] = self.json_data["Signals"][i]['Signedness']
            listing['Word Length'] = self.json_data["Signals"][i]['Word Length']
            listing['Fraction Length'] = self.json_data["Signals"][i]['Fraction Length']
            self.signals_of_interest[i] = listing

        print("Python --> Reading config file")
        with open(config_file, "r") as jsonfile:
            self.json_data = json.load(jsonfile)

        self.libero_location = self.json_data["Libero_Location"]
        self.project_location = self.json_data["Project_Location"]
        self.project_file = self.json_data["Project_File"]
        self.test_file = self.json_data["vhdl_test"]
        self.vhdl_entities = self.json_data["vhdl_entities"]
        self.notes = self.json_data["Notes"]
        self.log_file = log_file

    def simulate(self, config_file):
        print("Python --> Running Libero for Simulation")
        start_time = datetime.now()
        print("Python --> Start Simulation Time:", start_time.strftime("%H:%M:%S"))
        subprocess.run([self.libero_location, "script:libero_simulate_spectrometer.tcl",
                        f"script_args:{self.libero_location} {self.project_location} {self.project_file} {self.log_file} {self.test_file} {self.vhdl_entities}",
                        "logfile:make_libero.log"])

        print("Python --> Simulation finished")
        print("Python --> End Simulation Time:", datetime.now().strftime("%H:%M:%S"))
        time_difference = datetime.now() - start_time
        print("Python --> Simulation Duration:", str(time_difference))

    def analyze_file(self, name):
        if (not os.path.isfile(f"{name}.vcd")):
            sys.exit(f"Python --> {name}.vcd does not exist")
        else:
            print(f"Python --> {name}.vcd found")
            self.name = name
            self.sensitivity_list = {}
            self.pairs = {}
            self.vals = {}
            self.top = None
            self.time = 0
            self.prev_time = 0
            self.plot_num = 0
            f = open(f"{name}.vcd", "rb")
            self.tokens = tokenize(f)

    def header(self):
        for num,i in enumerate(self.tokens):
            #Still in the preamble. It's getting header data and signal definitions.
            if (i.kind is TokenKind.TIMESCALE):
                self.time_magnitude = i.timescale.magnitude.value
                self.timescale = i.timescale.unit.value

            elif (i.kind is TokenKind.SCOPE):
                self.top = i.scope.ident

            elif (i.kind is TokenKind.VAR):
                id_code = i.var.id_code
                reference = i.var.reference
                bit_index = i.var.bit_index
                array_type = type(bit_index)
                #This means it's an array of an array, so like $var wire 1 " pks_ref [0][12] $end
                #This correction assumes you can only have double nested arrays. It will have to be fixed if you can have triple or higher
                if array_type is tuple:
                    reference = f"{reference}_{bit_index[0]}"
                    bit_index = bit_index[1]
                #Want to create signals that keep the arrays together.
                if reference in self.signals_of_interest:
                    if reference not in self.pairs:
                        #First time a signal name is found. A key in the master list is made for it as a 1-bit value
                        #And a spot in the value tracker array ismade too
                        key_in = {}
                        key_in[id_code] = bit_index
                        key_in['bits'] = 1
                        self.pairs[reference] = key_in

                        val_in = {}
                        val_in['x'] = []
                        val_in['y'] = []
                        val_in['last_val'] = 0
                        val_in['modified'] = False
                        self.vals[reference] = val_in

                    else:
                        #This means this key is part of an array, the extra bit and indicator is added to the master list
                        key_in = {}
                        key_in[id_code]=bit_index
                        key_in['bits'] = self.pairs[reference]['bits'] + 1
                        self.pairs[reference].update(key_in)

                    new_sensitive_var = {}
                    new_sensitive_var[id_code] = reference
                    self.sensitivity_list.update(new_sensitive_var)

            #The last line of the preamble/header
            elif (i.kind is TokenKind.ENDDEFINITIONS):
                #print (self.pairs)
                #print (self.vals)
                #print (self.sensitivity_list)
                break

    def body(self):
        for num,i in enumerate(self.tokens):
            #Unfortunately the only way to check these files is line by line as far as I can tell
            #If the time has changed, check for any values that may have changed in the previous time interval
            #If there is an array, we want the final value to be recorded after all bits of the array have been registered as changed.
            #VCD files end with a time stamp, so this will be the last section read when analyzing a file
            if (i.kind is TokenKind.CHANGE_TIME):
                self.prev_time = self.time
                self.time = int(i.data)
                for j in self.pairs:
                    if (self.vals[j]['modified'] == True):
                        x = self.vals[j]['x']
                        y = self.vals[j]['y']
                        lv = self.vals[j]['last_val']
                        signedness = self.signals_of_interest[j]['Signedness']
                        word_length = self.signals_of_interest[j]['Word Length']
                        fraction_length = self.signals_of_interest[j]['Fraction Length']

                        if (signedness == 'signed'):
                            #If first digit is one, it's a negative number in two's complement
                            if (((lv >> (word_length - 1)) & 0x1) == 1):
                                new_val = (lv - (1 << word_length)) /(2**fraction_length)
                                x.append(self.prev_time)
                                y.append(new_val)
                            else:
                                new_val = (lv) /(2**fraction_length)
                                x.append(self.prev_time)
                                y.append(new_val)
                        else:
                            new_val = (lv) /(2**fraction_length)
                            x.append(self.prev_time)
                            y.append(new_val)

                        self.vals[j]['x'] = x
                        self.vals[j]['y'] = y
                        self.vals[j]['modified'] = False

            #Each line after the time indicates a changed value. See if the changed value is one that is tracked
            elif (i.kind is TokenKind.CHANGE_SCALAR):
                id_code = i.scalar_change.id_code
                if id_code in self.sensitivity_list:
                    signal = self.sensitivity_list[id_code]
                    sublist = self.pairs[signal]
                    previous_val = self.vals[signal]['last_val']
                    bit = sublist[id_code]
                    value = i.scalar_change.value
                    #Update most recent value of that array for that bit with the specified value
                    if (value == '0'):  #Is there a better way to deal with don't cares?
                        val = 0
                        if (bit == None):
                            previous_val = val
                        else:
                            #To change a single bit to a 0, need to AND with a mask of 1s with a 0 in the desired bit location
                            inverse_mask = 1 << bit
                            mask = ~inverse_mask
                            previous_val = previous_val & mask
                    elif (value == '1'):
                        val = 1
                        if (bit == None):
                            previous_val = val
                        else:
                            #To add a 1, simple to use OR
                            previous_val = previous_val | (val << bit)
                    else:
                        print(f"Python --> WARNING: Value for {signal} at time {self.time} is {value}")

                    #Keep this value in case the next line has the next bit of the array
                    #Mark it so that this value gets saved at the end of the time tick
                    self.vals[signal]['last_val'] = previous_val
                    self.vals[signal]['modified'] = True

            elif (i.kind is TokenKind.DUMPOFF):
                #For some reason with ModelSim, after you do a `vcd flush` to get the file to disk, it gives final values to every variable as "don't know" or X.
                #So ignore everything after the `vcd flush` command
                break

        #After the file is done, add the last value as the final time tick
        #It helps with analysis later
        for i in self.vals:
            self.vals[i]['x'].append(self.time)
            self.vals[i]['y'].append(self.vals[i]['last_val'])

        print("Python --> Done with VCD body")

    def plot(self, index):
        navg_main = 2**int(self.vals["Navg_main"]['y'][0])
        navg_notch = 2**int(self.vals["Navg_notch"]['y'][0])
        notch_en = int(self.vals["notch_en"]['y'][0])

        title = f"{self.name}_{self.notes}"
        filename = f"{self.name}_notch_en_{notch_en}_navg_main{navg_main}_navg_notch{navg_notch}_{self.notes}"

        self.plot_num = 0
        total_bins = len(self.vals[f"outbin{index}"]['y'])

        x = []
        y = []
        time_record = []
        for i in range(total_bins-1):
            x.append(self.vals[f"outbin{index}"]['y'][i] / 2048 * 100 / 2)
            time = self.vals[f"outbin{index}"]['x'][i]

            try:
                val_index = self.vals[f"pks{index}"]['x'].index(time)
                successful_time = time
            except ValueError:
                val_index = self.vals[f"pks{index}"]['x'].index(successful_time)

            y.append(self.vals[f"pks{index}"]['y'][val_index])

        fig, ax = plt.subplots()

        #title = self.signals_of_interest[f"pks{index}"]["Title"]
        fig.suptitle(title, fontsize = 20)
        yaxis = self.signals_of_interest[f"pks{index}"]["Y-axis"]
        ax.set_ylabel(yaxis, fontsize=14)
        ax.set_yscale('log')
        ax.set_xlabel('MHz', fontsize=14)
        ax.ticklabel_format(style='plain', useOffset=False, axis='x')
        ax.plot(x, y)
#        print(x)
#        print(y)
#        ax.set_xlim([0,1])
        plot_path = os.path.join(os.getcwd(), "plots")
        if not (os.path.exists(plot_path)):
            os.makedirs(plot_path)

        fig.savefig (os.path.join(plot_path, f"{filename}.jpg"))
        #np.save(os.path.join(plot_path, f"data{self.plot_num}"), x, y)
        self.plot_num = self.plot_num + 1

        plt.show()

    def plot_experimental(self, blocks):
        print(blocks)

        x.analyze_file(f"{sys.argv[2]}_{blocks[0]}")
        x.header()
        x.body()

        total_bins = len(self.vals["outbin"]['y'])

        x_notch = []
        y_notch = []
        time_record = []
        for i in range(total_bins-1):
            x_notch.append(self.vals["outbin"]['y'][i] / 2048 * 100 / 2)
            time = self.vals["outbin"]['x'][i]

            try:
                val_index = self.vals["pks0"]['x'].index(time)
                successful_time = time
            except ValueError:
                val_index = self.vals["pks0"]['x'].index(successful_time)

            y_notch.append(self.vals["pks0"]['y'][val_index])

        x.analyze_file(f"{sys.argv[2]}_{blocks[1]}")
        x.header()
        x.body()

        total_bins = len(self.vals["outbin"]['y'])

        x_none = []
        y_none = []
        time_record = []
        for i in range(total_bins-1):
            x_none.append(self.vals["outbin"]['y'][i] / 2048 * 100 / 2)
            time = self.vals["outbin"]['x'][i]

            try:
                val_index = self.vals["pks0"]['x'].index(time)
                successful_time = time
            except ValueError:
                val_index = self.vals["pks0"]['x'].index(successful_time)

            y_none.append(self.vals["pks0"]['y'][val_index])

        fig, ax = plt.subplots()

        #title = self.signals_of_interest["pks0"]["Title"]
        fig.suptitle("Comb test", fontsize = 20)
        yaxis = self.signals_of_interest["pks0"]["Y-axis"]
        ax.set_ylabel(yaxis, fontsize=14)
#        ax.set_yscale('log')
        ax.set_xlabel('MHz', fontsize=14)
        ax.ticklabel_format(style='plain', useOffset=False, axis='x')
        none, = ax.plot(x_none, y_none)
        notch, = ax.plot(x_notch, y_notch)
        none.set_label('Regular')
        notch.set_label("Notch Filter")
        ax.legend()
#        print(x)
#        print(y)
#        ax.set_xlim([0,1])
        plot_path = os.path.join(os.getcwd(), "plots")
        if not (os.path.exists(plot_path)):
            os.makedirs(plot_path)

        fig.savefig (os.path.join(plot_path, f"comb_test.jpg"))
        #np.save(os.path.join(plot_path, f"data{self.plot_num}"), x, y)
        self.plot_num = self.plot_num + 1

        plt.show()

if __name__ == "__main__":
    if len(sys.argv) < 3:
        sys.exit(f"Error: You need to supply a config file and a unique name for this test as the 2 arguments! You had {len(sys.argv)-1} arguments!")
    x = LuSEE_Integrated_Simulator(sys.argv[1],sys.argv[2])
    x.simulate(sys.argv[1])
    blocks = x.vhdl_entities.split()
#    x.plot_experimental(blocks)
#    sys.exit()
    for num,i in enumerate(blocks):
        x.analyze_file(f"{sys.argv[2]}_{i}")
        x.header()
        x.body()
        x.plot(num)
