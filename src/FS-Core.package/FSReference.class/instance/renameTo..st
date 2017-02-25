operations
renameTo: aStringOrPath
	
	| destinationPath |
	
	destinationPath := self filesystem rename: self to: aStringOrPath.
	
	destinationPath ifNotNil: [
		self 
			setFilesystem: filesystem 
			path: destinationPath ].
	^ self
		