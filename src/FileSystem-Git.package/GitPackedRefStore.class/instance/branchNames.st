accessing
branchNames
	^ (self packedRefs
		select: [:each | each name beginsWith: 'refs/heads/'])
		collect: [:each | each name allButFirst: 'refs/heads/' size]