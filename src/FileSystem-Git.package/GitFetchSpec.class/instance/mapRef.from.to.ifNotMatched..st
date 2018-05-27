accessing
mapRef: refString from: sourceRefPatternString to: targetRefPatternString ifNotMatched: failBlock
	| prefix suffix branchName |
	prefix := sourceRefPatternString copyUpTo: $*.
	(refString beginsWith: prefix) ifFalse: [^ failBlock value].
	(sourceRefPatternString size == prefix size) ifTrue:
		[refString size == prefix size
			ifTrue: [^ targetRefPatternString]
			ifFalse: [^ failBlock value]].
	suffix := sourceRefPatternString allButFirst: prefix size + 1. "all but prefix*"
	(suffix notEmpty and: [(refString endsWith: suffix) not]) ifTrue: [^ failBlock value].
	branchName := refString
		copyFrom: prefix size + 1
		to: refString size - suffix size.
	^ (prefix := targetRefPatternString copyUpTo: $*),
		branchName,
		(targetRefPatternString allButFirst: prefix size + 1)