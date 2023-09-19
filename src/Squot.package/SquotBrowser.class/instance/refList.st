ui
refList
	^ self activeWorkingCopy ifNotNil: #allReferences ifNil: [{}]