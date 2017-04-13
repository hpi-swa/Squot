actions
actionBranchAdd
	| name |
	self commitSelection ifNil: [^ self].
	name := UIManager default request: 'New branch name'.
	(name isNil or: [name isEmpty]) ifTrue: [^ self].
	self projectSelection repository newHistorian: name version: self commitSelection version.
	self refresh.