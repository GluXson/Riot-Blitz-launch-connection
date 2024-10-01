Set objShell = WScript.CreateObject("WScript.Shell")
pythonCheck = objShell.Run("python --version", 0, True)

If pythonCheck <> 0 Then
    WScript.Quit
End If

objShell.Run "cmd /c pip install psutil", 0, True
objShell.Run "cmd /c pip install time", 0, True
objShell.Run "cmd /c pip install subprocess", 0, True
objShell.Run "cmd /c pip install os", 0, True

scriptPath = Left(WScript.ScriptFullName, Len(WScript.ScriptFullName) - Len(WScript.ScriptName))
pythonPath = "python" 
objShell.Run "cmd /c " & pythonPath & " """ & scriptPath & "VBS_creator.py""", 0, False
