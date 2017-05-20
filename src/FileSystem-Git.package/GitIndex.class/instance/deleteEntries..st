operations
deleteEntries: aCollectionOfRelativePaths
	workingCopyDir := repository workingCopyDir.
	aCollectionOfRelativePaths do: [:each | self removeEntryFor: each].