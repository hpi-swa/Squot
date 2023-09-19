actions
actionCreateBranchAtActiveCommit
	| name |
	self activeWorkingCopyIfNilInformAnd: [^ nil].
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	name := UIManager default request:
		('Create a branch at {1}. Branch name:' format: {self activeCommit showOneLine}).
	name isEmptyOrNil ifTrue: [^ self].
	self activeWorkingCopy createBranchNamed: name at: self activeCommit.
	^ name