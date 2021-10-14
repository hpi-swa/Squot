initialize-release
initialize

	super initialize.
	commitListIndex := 1.
	self repositoryList
		ifEmpty: [repositoryListIndex := 0]
		ifNotEmpty: [repositoryListIndex := 1]. 