enumerating
collect: aBlock
	^ self class
		left: (aBlock value: self left)
		right: (aBlock value: self right)
		base: (aBlock value: self base)