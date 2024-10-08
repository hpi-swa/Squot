actions-private
postDialogCommit
	self checkIsAtOriginalHeadCommit ifFalse: [^ self].
	(self checkHasConflictsWhile: self commitActionName) ifTrue: [^ self].
	self isMessageEmpty ifTrue: [^ self].
	self commitNow.