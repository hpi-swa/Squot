operations
removeEntryFor: aRelativePath
	| searchEntry |
	searchEntry := GitIndexEntry fromPath: aRelativePath in: workingCopyDir.
	entries
		findBinaryIndex: searchEntry compareWithEach
		do: [:index | entries removeAt: index]
		ifNone: [].