initialize-release
initialize
	seen := Set new.
	revList := OrderedCollection new.
	searchFrontier := Stack new.
	sinkCommits := Array empty.