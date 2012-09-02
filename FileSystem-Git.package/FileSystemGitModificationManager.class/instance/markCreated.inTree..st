accessing
markCreated: aPath inTree: aTree
	| newTree |
	aPath = FSPath root ifTrue: [ ^ self ].

	treeMap
		at: aPath parent
		ifAbsentPut: [ self newTreeFrom: aTree ].
	
	(createdPaths
		at: aPath parent
		ifAbsentPut: [ FileSystemGitSetWrapper new]) 
			add: aPath.