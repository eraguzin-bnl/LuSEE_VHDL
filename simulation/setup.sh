#!/bin/bash
echo "LuSEE --> Setting up LuSEE VHDL simulation environment"
python3 -m venv ./venv
echo "LuSEE --> Python venv setup"
source venv/bin/activate
echo "LuSEE --> Inside Python venv"
pip install -r requirements.txt
echo "LuSEE --> Python packages installed"
cp config_example.json config.json
echo "LuSEE --> You now have your own 'config.json', don't forget to edit it with the path to this directory"
echo -e "LuSEE --> Once done, run\npython3 simulate_plot.py config.json"
