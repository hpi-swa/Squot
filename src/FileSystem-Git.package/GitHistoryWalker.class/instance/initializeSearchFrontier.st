initialize-release
initializeSearchFrontier
	searchFrontier := Heap sortBlock: [:a :b | a author timeStamp > b author timeStamp].