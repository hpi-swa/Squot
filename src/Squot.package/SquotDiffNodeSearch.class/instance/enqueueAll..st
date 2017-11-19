visiting
enqueueAll: aCollection
	upcomingNodes addAll: (aCollection reject: [:each | visitedNodes includes: each]).