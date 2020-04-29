accessing
targetOf: aString
	"Answer the value of the reference, unresolved. Answer nil if the reference does not exist."
	| file |
	self deprecated: 'Use ref: instead'.
	file := baseDir resolve: aString.
	file exists ifFalse: [ ^ nil ].
	^ file readStreamDo: [ :stream | stream contents asString ]