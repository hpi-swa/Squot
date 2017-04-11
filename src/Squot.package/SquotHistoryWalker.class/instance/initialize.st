initialize-release
initialize
	seen := Set new.
	versionList := OrderedCollection new.
	searchFrontier := Heap sortBlock: [:a :b | (a metadata at: #timestamp) > (b metadata at: #timestamp)].
	sinkVersions := Array empty.