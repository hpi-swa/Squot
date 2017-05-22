initialize-release
initializeSearchFrontier
	searchFrontier := Heap sortBlock: [:a :b | (a metadata at: #timestamp) > (b metadata at: #timestamp)].