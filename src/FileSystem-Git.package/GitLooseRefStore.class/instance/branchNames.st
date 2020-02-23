accessing
branchNames
	| headsDir |
	(headsDir := baseDir / 'refs' / 'heads') exists ifFalse: [^ #()].
	^ headsDir allFiles
		collect: [:each | self refFromFile: each relativeTo: headsDir]