writing
nextPutAll: aCollection
	(isBinary or: [aCollection class == ByteArray]) ifTrue: [^ self basicNextPutAll: aCollection].
	^ self converter nextPutAll: aCollection toStream: self