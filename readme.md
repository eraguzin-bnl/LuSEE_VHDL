Navigate to the simulation directory and use

`./setup.sh`

Fill out your own `config.json` file and make sure you put your local locations for Libero and the LuSEE directory. This is set up to simulate the spectrometer only, using the testbench `SPEC_TST.vhd`

Run like:

`python3 simulate_plot.py config.json`

You can simulate multiple blocks in parallel. See here in `SPECT_TST.vhd`. They all must have a unique instantiation name, but you can include multiple blocks with different averaging, or disable notch filtering, etc...

![image](https://user-images.githubusercontent.com/32136565/233469087-37551b6e-8eb8-457a-b4a1-360f0ad52f4c.png)

![image](https://user-images.githubusercontent.com/32136565/233469230-139fc872-ceb5-4f79-942d-32fab5957e29.png)

The `config.json` file should have the names of the VHDL blocks you are simulating:

![image](https://user-images.githubusercontent.com/32136565/233469479-1f4640f1-8276-45eb-a4bd-f7cd1f20b009.png)

The Python analysis will create plots and save to filenames based on the name of the entity, some averaging parameters, and the `Notes` section where you can explain the specifics of the test.
