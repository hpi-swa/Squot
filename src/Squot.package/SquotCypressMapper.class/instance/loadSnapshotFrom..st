snapshot-creation
loadSnapshotFrom: aFilesystem
	^ [(self readerIn: aFilesystem) version snapshot]
		on: DirectoryDoesNotExist
		do: [^ MCSnapshot empty]