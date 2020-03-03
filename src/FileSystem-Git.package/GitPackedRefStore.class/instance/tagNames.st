accessing
tagNames
	^ (self packedRefs
		select: [:each | each name beginsWith: 'refs/tags/'])
		collect: [:each | (each name allButFirst: 'refs/tags/' size)]