accessing
changes
	self isEmpty ifTrue: [^ {}].
	^ {SquotMetadataMappersChange withChangeSet: self}