applying
deleteFile: aPath

	| targetReference |
	targetReference := self targetReferenceOn: aPath.
	targetReference exists
		ifTrue: [targetReference delete]