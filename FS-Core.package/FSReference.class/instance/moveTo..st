operations
moveTo: aReference
	
	| result |
	result := self filesystem rename: self path as: aReference path.
	result ifNotNil: [self setFilesystem: filesystem path: aReference path ].		