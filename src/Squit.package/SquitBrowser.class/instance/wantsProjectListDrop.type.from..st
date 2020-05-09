drag and drop
wantsProjectListDrop: draggedObject type: transferType from: sourceObject
	SquitSettings enableDragAndDrop ifFalse: [^ false].
	^ (draggedObject respondsTo: #snapshot) and: [draggedObject respondsTo: #parents] "is a version"