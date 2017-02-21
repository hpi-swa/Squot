accessing
markCreated: aPath inTree: aTree
	aPath = Path root ifTrue: [ ^ self ].

	treeMap
		at: aPath parent
		ifAbsentPut: [ self newTreeFrom: aTree ].
	
	(createdPaths
		at: aPath parent
		ifAbsentPut: [ GitSetWrapper new]) 
			add: aPath.
	
	deletedPaths
		at: aPath parent
		ifPresent: [:set | set remove: aPath ifAbsent: []].