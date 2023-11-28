image-hash
imageHash
	| hash lastHash |
	hash := self basicImageHash.
	lastHash := self lastImageHash.
	self lastImageHash: hash.
	hash ~= lastHash ifTrue: [
		self handleMovedImageFrom: lastHash to: hash].
	^ hash