snapshot-creation
loadSnapshotFrom: aFilesystem
	^ [(self readerOn: (self packageDirectoryIn: aFilesystem)) version snapshot]
		on: self expectedReadErrorsOnMissingSnapshot
		do: [^ MCSnapshot empty]