as yet unclassified
nameOf: anObject ifAbsentAssign: nameBlock
	| name |
	name := graphForStorage nameOf: anObject ifAbsent: [].
	name ifNil:
		[name := nameBlock value.
		self assign: name to: anObject].
	^ name
	