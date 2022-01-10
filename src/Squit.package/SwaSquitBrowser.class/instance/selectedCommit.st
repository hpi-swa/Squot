accessing
selectedCommit

	self commitListIndex = 0 ifTrue: [^ nil].
	^ self commitList at: self commitListIndex