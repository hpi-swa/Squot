actions
actionCreateBranchAtActiveCommitFromRef: aStringOrNil
	| name |
	self activeWorkingCopyIfNilInformAnd: [^ nil].
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	name := self requestBranchNameFor: 'a branch' fromRef: aStringOrNil.
	name isEmptyOrNil ifTrue: [^ self].
	^ self activeWorkingCopy createBranchNamed: name at: self activeCommit