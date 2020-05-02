visiting
visitBlob: aBlob
	(self excludesObject: aBlob) ifTrue: [^ self].
	self addObject: aBlob