import psutil
import time
import subprocess
import os

user_folder = os.path.expanduser("~")
path = os.path.join(user_folder, 'AppData', 'Roaming', 'Microsoft', 'Windows', 'Start Menu', 'Programs', 'Blitz.lnk')

last_riot_status, last_blitz_status = False, False

def find_processes():
    riot_running = False
    blitz_running = False
    for proc in psutil.process_iter(['name']):
        pname = proc.info['name'].lower()
        if "riotclientservices.exe" in pname:
            riot_running = True
        if "blitz.exe" in pname:
            blitz_running = True
        if riot_running and blitz_running:
            break  
    return riot_running, blitz_running

while True:
    Riot, Blitz = find_processes()

    if (Riot != last_riot_status) or (Blitz != last_blitz_status):
        if Riot and not Blitz:
            try:
                subprocess.Popen(['cmd.exe', '/c', 'start', '', path])
            except:
                pass

        elif not Riot and Blitz:
            try:
                subprocess.run(['taskkill', '/f', '/im', 'Blitz.exe'])
            except:
                pass
            
    last_riot_status, last_blitz_status = Riot, Blitz
    
    time.sleep(10)
    os.system("cls")  
