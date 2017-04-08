history walking
startingFromAll: aCollectionOfCommits do: aBlock
	commitBlock := aBlock.
	searchFrontier addAll: aCollectionOfCommits.
	self performSearch.