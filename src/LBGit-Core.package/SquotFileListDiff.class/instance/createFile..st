applying
createFile: aPath

	| sourceReference targetReference |
	sourceReference := self sourceReferenceOn: aPath.
	sourceReference exists 
		ifFalse: [self error: 'Trying to apply a file addition of ''', aPath, ''' but file not existent in addition source'].
	targetReference := self targetReferenceOn: aPath.
	sourceReference copyTo: targetReference.