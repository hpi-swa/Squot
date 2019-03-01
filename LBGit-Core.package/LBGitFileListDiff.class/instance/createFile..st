applying
createFile: aPath

	| sourceReference targetReference |
	sourceReference := self sourceReferenceOn: aPath.
	sourceReference exists ifFalse: [^ self].
	targetReference := self targetReferenceOn: aPath.
	sourceReference copyTo: targetReference.