drag and drop
dragFromBranchList: index
	| branchName |
	SquitSettings enableDragAndDrop ifFalse: [^ nil].
	branchName := self branchList at: index.
	^ self projectSelection repository historianNamed: branchName