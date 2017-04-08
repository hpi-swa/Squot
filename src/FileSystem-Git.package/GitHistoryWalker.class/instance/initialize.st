initialize-release
initialize
	seen := Set new.
	revList := OrderedCollection new.
	searchFrontier := Heap sortBlock: [:a :b | a author timeStamp > b author timeStamp].
	sinkCommits := Array empty.