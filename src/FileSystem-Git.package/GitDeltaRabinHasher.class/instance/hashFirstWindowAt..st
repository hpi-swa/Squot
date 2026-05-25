hashing
hashFirstWindowAt: anIndex
	self resetHashValue.
	anIndex to: anIndex + self class window - 1 do: [:each |
		self addFirstWindowValueAt: each].
	^ self hashValue