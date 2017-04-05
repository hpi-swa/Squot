initialize-release
initialize
	seen := Set new.
	revList := OrderedCollection new.
	searchFrontier := OrderedCollection new.
	sinkCommits := Array empty.