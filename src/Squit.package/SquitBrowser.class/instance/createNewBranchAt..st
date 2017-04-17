actions
createNewBranchAt: aVersion
	| name |
	name := UIManager default request: 'New branch name'.
	(name isNil or: [name isEmpty]) ifTrue: [^ false].
	self projectSelection repository newHistorian: name version: aVersion.
	^ true