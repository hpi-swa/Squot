actions
actionCreateBranchAtActiveCommitFromRef: aStringOrNil
	| name branch |
	self activeWorkingCopyIfNilInformAnd: [^ nil].
	self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	name := self requestBranchNameFor: 'a branch' fromRef: aStringOrNil.
	name isEmptyOrNil ifTrue: [^ self].
	branch := self activeWorkingCopy createBranchNamed: name at: self activeCommit.
	aStringOrNil ifNotNil: [self checkSetUpstreamForCreatedBranch: branch to: aStringOrNil].
	^ branch