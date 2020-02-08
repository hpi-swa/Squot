drag and drop
wantsProjectListDrop: draggedObject type: transferType from: sourceObject
	SquitSettings enableDragAndDrop ifFalse: [^ false].
	^ false