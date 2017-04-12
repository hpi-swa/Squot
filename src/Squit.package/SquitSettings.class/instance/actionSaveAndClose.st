actions
actionSaveAndClose
	userName ifNotNil: [GitStamp defaultName: userName].
	userEmail ifNotNil: [GitStamp defaultEmail: userEmail].
	self changed: #close.