public-accessing-references
nameOf: reference in: referenceDirString
	^ (reference beginsWith: referenceDirString)
		ifTrue: [reference allButFirst: referenceDirString size]
		ifFalse: [reference]