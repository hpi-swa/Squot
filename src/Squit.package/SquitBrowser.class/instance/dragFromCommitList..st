drag and drop
dragFromCommitList: aVersion
	SquitSettings enableDragAndDrop ifFalse: [^ nil].
	^ aVersion