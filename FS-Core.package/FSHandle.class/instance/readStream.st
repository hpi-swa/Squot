public
readStream
	^ self isOpen ifTrue: [FSReadStream onHandle: self]