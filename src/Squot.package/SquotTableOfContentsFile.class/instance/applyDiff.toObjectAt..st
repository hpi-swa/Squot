adding and removing
applyDiff: anArtifactDiff toObjectAt: path
	anArtifactDiff right wantsToBeInTableOfContents
		ifTrue: [anArtifactDiff right storeInfo serializer
				ifNotNil: [:serializer | self dictionary at: path put: serializer]
				ifNil: [self dictionary at: path ifAbsentPut: [nil]]]
		ifFalse: [self dictionary removeKey: path ifAbsent: []].