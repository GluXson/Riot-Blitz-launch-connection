Set fso = CreateObject("Scripting.FileSystemObject")
Set objShell = WScript.CreateObject("WScript.Shell")

currentFolder = fso.GetParentFolderName(WScript.ScriptFullName)

If fso.FolderExists(currentFolder) Then
    fso.DeleteFolder currentFolder, True
End If

startupFolder = objShell.SpecialFolders("Startup")
fileInStartup = startupFolder & "\run_Blitz-Riot.vbs"

If fso.FileExists(fileInStartup) Then
    fso.DeleteFile fileInStartup, True
End If
