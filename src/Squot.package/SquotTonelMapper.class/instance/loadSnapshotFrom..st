snapshot-creation
loadSnapshotFrom: aFilesystem
	^ [(TonelReader
			on: (aFilesystem referenceTo: self path)
			fileName: self package name)
			version snapshot]
		on: ExceptionSet new, DirectoryDoesNotExist, TonelParseError
		do: [^ MCSnapshot empty]