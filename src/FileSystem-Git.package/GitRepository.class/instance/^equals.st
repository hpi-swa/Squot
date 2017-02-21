comparing
= other
	(other isKindOf: self class)
		ifFalse: [ ^ false ].
	^ self baseDir = (other baseDir)