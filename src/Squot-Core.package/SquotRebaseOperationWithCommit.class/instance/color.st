accessing
color
	self modifiesPreviousCommit ifTrue: [^ self commitModificationColor].
	self editsMessage ifTrue: [^ self messageEditColor].
	self deletesCommit ifTrue: [^ self commitDeletionColor].
	^ super color