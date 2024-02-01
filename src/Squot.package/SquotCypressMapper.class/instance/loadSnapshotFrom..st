as yet unclassified
loadSnapshotFrom: aFilesystem
	^ [(self readerIn: aFilesystem) version snapshot]
		on: DirectoryDoesNotExist, TonelParseError
		do: [^ MCSnapshot empty]