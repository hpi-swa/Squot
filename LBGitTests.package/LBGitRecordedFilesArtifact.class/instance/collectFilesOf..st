as yet unclassified
collectFilesOf: aGitTreeEntrySet

	| result |
	result := Set new.
	aGitTreeEntrySet do: [:each | 
		each isInDirectoryMode 
			ifTrue: [(self collectFilesOf: (each object entries)) do: [:eachSub | result add: each entryName,'/', eachSub]]
			ifFalse: [result add: each entryName] ].
	^ result