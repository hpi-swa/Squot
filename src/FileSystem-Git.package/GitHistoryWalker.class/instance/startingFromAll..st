history walking
startingFromAll: gitCommits
	commitBlock := nil.
	searchFrontier addAll: gitCommits.
	self performSearch.
	^ revList