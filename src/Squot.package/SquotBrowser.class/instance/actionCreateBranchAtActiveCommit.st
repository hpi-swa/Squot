actions
actionCreateBranchAtActiveCommit
	| name |
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	name := UIManager default request:
		('Create a branch at {1}. Branch name:' format: {self activeCommit showOneLine}).
	name isEmptyOrNil ifTrue: [^ self].
	self workingCopy createBranchNamed: name at: self activeCommit.