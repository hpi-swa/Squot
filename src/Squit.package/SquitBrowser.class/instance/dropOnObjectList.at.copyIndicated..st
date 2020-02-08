drag and drop
dropOnObjectList: anObject at: index copyIndicated: aBoolean
	SquitSettings enableDragAndDrop ifFalse: [^ self].
	self notYetImplemented