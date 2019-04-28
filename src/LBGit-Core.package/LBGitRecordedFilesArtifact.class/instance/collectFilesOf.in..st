as yet unclassified
collectFilesOf: aGitTreeEntrySet in: directoryPath

	| result |
	result := Dictionary new.
	aGitTreeEntrySet do: [:each | | fullPath |
		fullPath := directoryPath, each entryName.
		(self isSquotFile: fullPath)
			ifFalse: [
				each isInDirectoryMode 
					ifTrue: [result addAll: (self collectFilesOf: each object entries in: fullPath, '/')]
					ifFalse: [result at: fullPath put: (LBGitFileMetadata onTreeEntry: each)]]].
	result keys select: [:each | self isSquotFile: each] thenDo: [:each | result removeKey: each].
	^ result