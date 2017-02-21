internal
ensure: aPath 
	aPath isRoot ifTrue: [ ^ aPath ].
	"Make sure we have the lates version of the cache"
	(modManager isDeleted: aPath) ifTrue: [ ^ aPath ].
	(cacheStore exists: aPath) ifTrue: [ ^ aPath ].
	
	self loadFromRepository: aPath.
	^ aPath.