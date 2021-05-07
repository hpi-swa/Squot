drag and drop
dropOnProjectList: anObject at: index copyIndicated: aBoolean
	SquitSettings enableDragAndDrop ifFalse: [^ self].
	^ self showMenuForVersion: anObject
		onWorkingCopy: (self projectList at: index)