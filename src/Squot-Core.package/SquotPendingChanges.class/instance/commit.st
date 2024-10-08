actions
commit
	(self isMerge not and: [self isEmpty]) ifTrue: [^ self nothingToCommit].
	self shouldOpenDialog ifTrue: [^ self openDialogToCommit].
	^ self commitNow