accessing
diffAt: aPath

	^ (self diffs select: [:each | each path = aPath]) 
		ifEmpty: [nil]
		ifNotEmpty: [:found | found anyOne]