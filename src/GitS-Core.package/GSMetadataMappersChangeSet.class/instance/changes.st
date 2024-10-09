accessing
changes
	self isEmpty ifTrue: [^ {}].
	^ {GSMetadataMappersChange withChangeSet: self}