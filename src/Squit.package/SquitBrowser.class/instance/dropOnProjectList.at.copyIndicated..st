drag and drop
dropOnProjectList: anObject at: index copyIndicated: aBoolean
	SquitSettings enableDragAndDrop ifFalse: [^ self].
	((anObject respondsTo: #snapshot) and: [anObject respondsTo: #parents]) ifTrue:
		[^ self showMenuForVersion: anObject
			onWorkingCopy: (self projectList at: index)].
	^ self notYetImplemented