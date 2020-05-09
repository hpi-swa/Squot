drag and drop
dropOnCommitList: anObject on: aVersion copyIndicated: aBoolean
	SquitSettings enableDragAndDrop ifFalse: [^ self].
	^ self
		showMenuForVersion: anObject
		onVersion: aVersion