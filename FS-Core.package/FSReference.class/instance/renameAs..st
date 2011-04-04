operations
renameAs: aStringOrPath
	
	| res |
	res := self filesystem rename: self as: aStringOrPath.
	res ifNotNil: [self setFilesystem: filesystem path: (self filesystem resolvePath: aStringOrPath) ].
	^ self
		