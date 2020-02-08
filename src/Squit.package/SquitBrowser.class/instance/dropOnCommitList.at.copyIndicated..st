drag and drop
dropOnCommitList: anObject at: index copyIndicated: aBoolean
	SquitSettings enableDragAndDrop ifFalse: [^ self].
	self notYetImplemented