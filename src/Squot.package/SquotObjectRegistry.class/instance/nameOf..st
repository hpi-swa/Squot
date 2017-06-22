accessing
nameOf: anObject
	anObject ifNil: [^ #(nil)].
	^ objectNames at: anObject