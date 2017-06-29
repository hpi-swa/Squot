accessing
markCreated: aPath inTree: aTree
	aPath = FSPath root ifTrue: [ ^ self ].

	treeMap
		at: aPath parent
		ifAbsentPut:
			[aTree isEmpty ifTrue: [self logMessage: 'For a created entry, putting empty tree at ', aPath parent printString].
			self newTreeFrom: aTree].
	
	(createdPaths
		at: aPath parent
		ifAbsentPut: [ GitSetWrapper new]) 
			add: aPath.
	
	deletedPaths
		at: aPath parent
		ifPresent: [:set | set remove: aPath ifAbsent: []].