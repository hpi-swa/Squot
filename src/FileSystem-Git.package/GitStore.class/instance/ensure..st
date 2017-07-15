internal
ensure: aPath 
	self logMessage: 'ensure: that ', aPath printString, ' is loaded'.
	aPath isRoot ifTrue: [ ^ aPath ].
	"Make sure we have the lates version of the cache"
	(modManager isDeleted: aPath) ifTrue:
		[self logMessage: 'Was deleted previously: ', aPath printString.
		^ aPath].
	(cacheStore exists: aPath) ifTrue: [ ^ aPath ].
	
	self loadFromRepository: aPath.
	^ aPath.