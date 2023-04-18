import struct
import os
import matplotlib.pyplot as plt
import numpy

print("start")
with open("sky_100.bin", mode="rb") as data_file:
    data_bin = data_file.read()

file_size = len(data_bin)
formatter = f"<{int(file_size/2)}h"
print(formatter)
data = struct.unpack(formatter, data_bin)
for i in range(10):
    print(data[i])

data_shift = numpy.right_shift(data, 2)
#print(len(data_shift[0]))

fig, ax = plt.subplots()

title = "sky_100 time domain"
fig.suptitle(title, fontsize = 24)
yaxis = "watts"
ax.set_ylabel(yaxis, fontsize=14)
#ax.set_yscale('log')
ax.set_xlabel('time', fontsize=14)
ax.ticklabel_format(style='plain', useOffset=False, axis='x')
ax.plot(data)

plot_path = os.path.join(os.getcwd(), "plots")
if not (os.path.exists(plot_path)):
    os.makedirs(plot_path)

fig.savefig (os.path.join(plot_path, "sky_100.jpg"))
#np.save(os.path.join(plot_path, f"data{self.plot_num}"), x, y)

plt.show()


fig, ax = plt.subplots()

title = "sky_100 time domain, 14 bit"
fig.suptitle(title, fontsize = 24)
yaxis = "watts"
ax.set_ylabel(yaxis, fontsize=14)
#ax.set_yscale('log')
ax.set_xlabel('time', fontsize=14)
ax.ticklabel_format(style='plain', useOffset=False, axis='x')
ax.plot(data)

plot_path = os.path.join(os.getcwd(), "plots")
if not (os.path.exists(plot_path)):
    os.makedirs(plot_path)

fig.savefig (os.path.join(plot_path, "sky_100_14_bit.jpg"))
#np.save(os.path.join(plot_path, f"data{self.plot_num}"), x, y)

plt.show()


print("done")

