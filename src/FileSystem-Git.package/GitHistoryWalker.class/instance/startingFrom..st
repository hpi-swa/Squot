history walking
startingFrom: aGitCommit
	commitBlock := nil.
	searchFrontier add: aGitCommit.
	self performSearch.
	^ revList