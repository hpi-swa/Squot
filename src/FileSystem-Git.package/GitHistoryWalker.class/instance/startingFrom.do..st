history walking
startingFrom: aGitCommit do: aBlock
	commitBlock := aBlock.
	searchFrontier add: aGitCommit.
	self performSearch.