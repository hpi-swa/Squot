as yet unclassified
deleteFile: aPath

	| workingReference |
	workingReference := self workingReferenceOn: aPath.
	workingReference exists
		ifTrue: [workingReference delete]