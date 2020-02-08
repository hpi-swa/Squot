accessing
peek
	^ (searchFrontier detect: [:each | each isReachableFromSink not] ifNone: [^ nil]) object