#!/usr/bin/env python3
#Script by Eric to simulate with real data, get simulator output and plot it

import sys, os, json, subprocess

class LuSEE_Integrated_Simulator:
    def __init__(self, config_file):
        print("Python --> Welcome to the LuSEE Integrated Simulator")
        print("Python --> Reading config file")
        with open(config_file, "r") as jsonfile:
            json_data = json.load(jsonfile)

        libero_location = json_data["Libero_Location"]
        project_location = json_data["Project_Location"]
        project_file = json_data["Project_File"]

        print("Python --> Running Libero for Simulation")
        subprocess.run([libero_location, "script:libero_simulate_spectrometer.tcl",
                        f"script_args:{libero_location} {project_location} {project_file}",
                        "logfile:make_libero.log"])

if __name__ == "__main__":
    x = LuSEE_Integrated_Simulator(sys.argv[1])
