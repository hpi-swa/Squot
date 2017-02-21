delegate
exists: aPath
	(modManager isDeleted: aPath)
		ifTrue: [ ^ false ].
	self ensure: aPath.
	^ cacheStore exists: aPath