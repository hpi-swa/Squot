accessing
branchNames
	repository headsDir exists ifFalse: [^ #()].
	^ repository headsDir allFiles
		collect: [:each | self refFromFile: each relativeTo: repository headsDir]