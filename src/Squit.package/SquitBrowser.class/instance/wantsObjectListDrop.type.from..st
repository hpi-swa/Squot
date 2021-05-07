drag and drop
wantsObjectListDrop: draggedObject type: transferType from: sourceObject
	SquitSettings enableDragAndDrop ifFalse: [^ false].
	^ false