#Title = "Meta Updater"

Global resourceRoot$
Global metaFile

Global NewList fileList.s()

Procedure addFiles(templateLine$, folder$, extension$, isSubFolder = #False)
	If Not isSubFolder
		ClearList(fileList())
	EndIf
	dir = ExamineDirectory(#PB_Any, resourceRoot$ + folder$, "*.*")
	If IsDirectory(dir)
		While NextDirectoryEntry(dir)
			name$ = DirectoryEntryName(dir)
			If name$ <> "." And name$ <> ".."
				Select DirectoryEntryType(dir)
					Case #PB_DirectoryEntry_Directory
						addFiles(templateLine$, folder$ + "/" + name$, extension$, #True)
					Case #PB_DirectoryEntry_File
						If LCase(GetExtensionPart(name$)) = LCase(extension$)
							AddElement(fileList())
							fileList() = folder$ + "/" + name$
						EndIf
				EndSelect
			EndIf
		Wend
		FinishDirectory(dir)
	EndIf
	If Not isSubFolder
		SortList(fileList(), #PB_Sort_Ascending)
		ForEach fileList()
			line$ = templateLine$
			WriteStringN(metaFile, ReplaceString(line$, "%FILE%", fileList(), #PB_String_NoCase))
		Next
	EndIf
EndProcedure

mainPath$ = GetPathPart(ProgramFilename())
resourceRoot$ = GetPathPart(RTrim(RTrim(mainPath$, "\"), "/"))
templateFile$ = mainPath$ + "meta.template.xml"

templateFile = ReadFile(#PB_Any, templateFile$)
If IsFile(templateFile)
	metaFile = CreateFile(#PB_Any, resourceRoot$ + "meta.xml")
	If IsFile(metaFile)
		Repeat
			line$ = ReadString(templateFile)
			trimLine$ = Trim(Trim(line$), Chr(9))
			If Left(trimLine$, 6) = "%LIST="
				listParameters$ = Mid(trimLine$, 7)
			Else
				If listParameters$
					folder$ = Trim(StringField(listParameters$, 1, ";"))
					extension$ = Trim(StringField(listParameters$, 2, ";"))
					addFiles(line$, folder$, extension$)
					listParameters$ = ""
				Else
					WriteStringN(metaFile, line$)
				EndIf
			EndIf
		Until Eof(templateFile)
		CloseFile(metaFile)
		MessageRequester(#Title, "meta.xml updated", #MB_ICONINFORMATION)
	Else
		MessageRequester(#Title, "Can not create meta.xml!" + Chr(13) + Chr(13) + "Resource root: " + resourceRoot$, #MB_ICONERROR)
	EndIf
	CloseFile(templateFile)
Else
	MessageRequester(#Title, "Can not read template file 'meta.template.xml'!" + Chr(13) + Chr(13) + "Template file: " + templateFile$, #MB_ICONERROR)
EndIf
; IDE Options = PureBasic 4.61 (Windows - x86)
; CursorPosition = 39
; FirstLine = 22
; Folding = -
; EnableXP
; UseIcon = Meta Updater.ico
; Executable = Meta Updater.exe
; EnableCompileCount = 40
; EnableBuildCount = 4
; EnableExeConstant
; IncludeVersionInfo
; VersionField0 = 1,0,0,0
; VersionField1 = 1,0,0,0
; VersionField2 = SelfCoders
; VersionField3 = Meta Updater
; VersionField4 = 1.0
; VersionField5 = 1.0
; VersionField6 = Meta Updater
; VersionField7 = Meta Updater
; VersionField8 = %EXECUTABLE
; VersionField13 = metaupdater@selfcoders.com
; VersionField14 = http://www.selfcoders.com
; VersionField15 = VOS_NT_WINDOWS32
; VersionField16 = VFT_APP