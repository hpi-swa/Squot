image-hash
imageHash
	| hash |
	hash := self basicImageHash.
	hash ~= self lastImageHash ifTrue: [self handleMovedImage].
	self lastImageHash: hash.
	^ hash