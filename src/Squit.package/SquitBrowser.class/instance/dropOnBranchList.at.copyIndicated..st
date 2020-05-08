drag and drop
dropOnBranchList: anObject at: index copyIndicated: aBoolean
	SquitSettings enableDragAndDrop ifFalse: [^ self].
	self notYetImplemented