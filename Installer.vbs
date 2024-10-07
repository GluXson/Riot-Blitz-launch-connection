Set objShell = WScript.CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

pythonCheck = objShell.Run("python --version", 0, True)

Do While pythonCheck <> 0
    pythonInstallerURL = "https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe"
    downloadPath = objShell.ExpandEnvironmentStrings("%TEMP%") & "\python_installer.exe"
    
    objShell.Run "curl -o """ & downloadPath & """ " & pythonInstallerURL, 0, True
    objShell.Run downloadPath & " /quiet InstallAllUsers=1 PrependPath=1", 0, True
    
    pythonCheck = objShell.Run("python --version", 0, True)
Loop

objShell.Run "cmd /c pip install psutil", 0, True

scriptPath = objFSO.GetParentFolderName(WScript.ScriptFullName) & "\VBS_creator.py"
objShell.Run "cmd /c python """ & scriptPath & """", 0, False


