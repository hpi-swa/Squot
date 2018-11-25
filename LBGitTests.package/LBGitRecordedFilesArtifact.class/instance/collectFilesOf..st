as yet unclassified
collectFilesOf: aGitTreeEntrySet

	| result |
	result := Dictionary new.
	aGitTreeEntrySet do: [:each | 
		each isInDirectoryMode 
			ifTrue: [(self collectFilesOf: each object entries) associationsDo: [:eachSub | result add: (each entryName,'/', eachSub key) -> eachSub value]]
			ifFalse: [result at: each entryName put: (LBGitFileMetadata onTreeEntry: each)]].
	result keys select: [:each | self isSquotFile: each] thenDo: [:each | result removeKey: each].
	^ result