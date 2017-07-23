accessing
markCreated: aPath inTree: aTree
	aPath = FSPath root ifTrue: [ ^ self ].

	self copiedTreeForModification: aTree at: aPath parent.
	
	(createdPaths
		at: aPath parent
		ifAbsentPut: [ GitSetWrapper new]) 
			add: aPath.
	
	deletedPaths
		at: aPath parent
		ifPresent: [:set | set remove: aPath ifAbsent: []].