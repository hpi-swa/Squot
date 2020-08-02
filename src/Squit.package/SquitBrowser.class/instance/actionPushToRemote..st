actions on branches
actionPushToRemote: aString
	| historian |
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	[self withUnitOfWork:
		[self push: historian toRemoteNamed: aString]] fork.