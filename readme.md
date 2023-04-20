Navigate to the `/simulation/` directory and use

`./setup.sh`

Fill out your own `/simulation/config.json` file and make sure you put your local locations for Libero and the LuSEE directory. This is set up to simulate the spectrometer only, using the testbench `/stimulus/SPEC_TST.vhd`

Run like:

`python3 simulate_plot.py config.json`

You can simulate multiple blocks in parallel. See here in `/stimulus/SPECT_TST.vhd`. They all must have a unique instantiation name, but you can include multiple blocks with different averaging, or disable notch filtering, etc...

![image](https://user-images.githubusercontent.com/32136565/233469087-37551b6e-8eb8-457a-b4a1-360f0ad52f4c.png)

![image](https://user-images.githubusercontent.com/32136565/233469230-139fc872-ceb5-4f79-942d-32fab5957e29.png)

The `/simulation/config.json` file should have the names of the VHDL entity blocks you are simulating:

![image](https://user-images.githubusercontent.com/32136565/233469479-1f4640f1-8276-45eb-a4bd-f7cd1f20b009.png)

The Python analysis will create plots titles and save to filenames based on the name of the entity, some averaging parameters, and the `Notes` section where you can explain the specifics of the test, such as `/simulation/plots/spectrometer_fixpt_1_notch_en_0_navg_main8_navg_notch2_sky_pf_100_A1.jpg`

![spectrometer_fixpt_1_notch_en_0_navg_main_8_navg_notch2_sky_pf_100_A1](https://user-images.githubusercontent.com/32136565/233471427-6fb239d2-07eb-406e-b4ef-9dcd1654054d.jpg)
