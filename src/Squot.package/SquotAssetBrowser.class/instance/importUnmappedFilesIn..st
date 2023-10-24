importing
importUnmappedFilesIn: anFSCommit
	| found |
	found := false.
	self activeWorkingCopy unmappedReferencesIn: anFSCommit do: [:each |
		self importUnmappedFile: each.
		found := true].
	found ifFalse: [self inform: 'No unmanaged files found.'].