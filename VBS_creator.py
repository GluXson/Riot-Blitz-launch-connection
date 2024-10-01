import os
import time
import subprocess

neighbor_file = 'riot-blitz.py'
script_location = os.path.abspath(__file__)
full_path = os.path.join(os.path.dirname(script_location), neighbor_file)

autostart_folder = os.path.join(os.getenv('APPDATA'), 'Microsoft', 'Windows', 'Start Menu', 'Programs', 'Startup')
vbs_filename = 'run_Blitz-Riot.vbs'
vbs_filepath = os.path.join(autostart_folder, vbs_filename)

vbs_content = f'Set WshShell = CreateObject("WScript.Shell")\n' \
              f'WshShell.Run "python {full_path}", 0'

with open(vbs_filepath, 'w') as vbs_file:
        vbs_file.write(vbs_content)

time.sleep(2)
subprocess.run(['cscript.exe', vbs_filepath], check=True)

