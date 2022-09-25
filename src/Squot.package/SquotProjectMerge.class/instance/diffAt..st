legacy
diffAt: path
	self flag: #deprecated.
	^ self additions detect: [:each | each object path = path] ifNone:
		[self removals detect: [:each | each object path = path] ifNone:
		[self elementMerges detect: [:each | each working artifact path = path] ifNone:
		[(KeyNotFound key: path) signal]]]
	