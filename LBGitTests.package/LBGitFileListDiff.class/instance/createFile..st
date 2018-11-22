as yet unclassified
createFile: aPath

	| gitReference workingReference |
	gitReference := self gitReferenceOn: aPath.
	workingReference := self workingReferenceOn: aPath.
	self flag: #TODO. "Do ensure the file does NOT exist workingReference ensureFile."
	gitReference copyTo: workingReference.