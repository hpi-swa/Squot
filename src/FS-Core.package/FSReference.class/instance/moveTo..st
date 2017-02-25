operations
moveTo: aReference
	
	| result |
	result := self filesystem rename: self path to: aReference path.
	result ifNotNil: [
		self setFilesystem: filesystem path: aReference path ].		