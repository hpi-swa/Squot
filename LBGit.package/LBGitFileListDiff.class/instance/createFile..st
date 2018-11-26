applying
createFile: aPath

	| sourceReference targetReference |
	sourceReference := self sourceReferenceOn: aPath.
	sourceReference exists ifFalse: [^ self].
	targetReference := self targetReferenceOn: aPath.
	self flag: #TODO. "Do ensure the file does NOT exist workingReference ensureFile."
	sourceReference copyTo: targetReference.