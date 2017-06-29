internal
updateCacheAt: aPath with: aGitTree
	modManager updateCacheAt: aPath with: aGitTree.
	(cacheStore exists: aPath) ifTrue: [ ^ self ].
	self logMessage: 'Initializing ', aGitTree typeCode, ' at ', aPath printString, ' in the memory store'.
	aGitTree isTree
		ifTrue: [ cacheStore ensureDirectory: aPath ]
		ifFalse: [
			"it is a file, hence load its contents into the cache"
			cacheStore ensureDirectory: aPath parent.
			(cache referenceTo: aPath) 
					writeStreamDo: [ :stream | stream nextPutAll: aGitTree bytes ]].
			