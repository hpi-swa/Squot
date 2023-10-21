importing
importUnmappedFilesIn: anFSCommit
	| found |
	found := false.
	self activeWorkingCopy unmappedReferencesIn: anFSCommit do: [:each |
		self importUnmappedFile: each.
		found := true].
	found ifFalse: [self inform: 'No untracked files found.'].