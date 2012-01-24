operations
renameTo: aStringOrPath
	
	| res |
	
	res := self filesystem rename: self to: aStringOrPath.
	
	res ifNotNil: [
		self 
			setFilesystem: filesystem 
			path: (self filesystem resolvePath: aStringOrPath) ].
	^ self
		