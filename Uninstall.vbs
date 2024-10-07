Set fso = CreateObject("Scripting.FileSystemObject")

autostartPath = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\run_Blitz-Riot.vbs")
If fso.FileExists(autostartPath) Then
    fso.DeleteFile autostartPath
End If

currentFolder = fso.GetAbsolutePathName(".")
On Error Resume Next
fso.DeleteFolder currentFolder, True

