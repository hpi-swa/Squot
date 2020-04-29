accessing
ref: aString
	"Answer the GitReference with the given name. Answer nil if the reference does not exist."
	| file target |
	file := baseDir resolve: aString.
	file exists ifFalse: [ ^ nil ].
	target := file readStreamDo: [ :stream | stream contents asString ].
	^ GitReference name: aString target: (target copyUpTo: Character lf)