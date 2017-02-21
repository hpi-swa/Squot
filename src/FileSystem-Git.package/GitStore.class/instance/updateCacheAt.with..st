internal
updateCacheAt: aPath with: aGitTree
	self flag: 'TODO: merge the modmanager cache and the store cache into a single instance'.
	modManager updateCacheAt: aPath with: aGitTree.
	(cacheStore exists: aPath) ifTrue: [ ^ self ].
	aGitTree isTree
		ifTrue: [ cacheStore ensureDirectory: aPath ]
		ifFalse: [
			"its a file, hence load its contents into the cache"
			cacheStore ensureDirectory: aPath parent.
			(cache referenceTo: aPath) 
					writeStreamDo: [ :stream | stream nextPutAll: aGitTree bytes ]].
			