drag and drop
dropOnBranchList: anObject at: index copyIndicated: aBoolean
	SquitSettings enableDragAndDrop ifFalse: [^ self].
	^ self
		showMenuForVersion: anObject
		onBranch: (self projectSelection repository historianNamed: (self branchList at: index))