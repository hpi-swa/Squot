accessing
markCreated: aPath inTree: aTree
	| newTree |
	aPath = Path root ifTrue: [ ^ self ].

	treeMap
		at: aPath parent
		ifAbsentPut: [ self newTreeFrom: aTree ].
	
	(createdPaths
		at: aPath parent
		ifAbsentPut: [ GitSetWrapper new]) 
			add: aPath.