accessing
resolvedAt: aString ifAbsentPut: aBlock
	| signature |
	signature := resolvedRefs at: aString ifAbsentPut:
		[aBlock value ifNil: [GitReference zeroSignature]].
	^ signature = GitReference zeroSignature ifTrue: [] ifFalse: [signature]