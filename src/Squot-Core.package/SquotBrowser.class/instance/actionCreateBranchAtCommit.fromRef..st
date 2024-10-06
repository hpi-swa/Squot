actions
actionCreateBranchAtCommit: aCommit fromRef: aStringOrNil
	| name branch |
	self activeWorkingCopyIfNilInformAnd: [^ nil].
	name := self requestBranchNameFor: 'a branch' at: aCommit fromRef: aStringOrNil.
	name isEmptyOrNil ifTrue: [^ nil].
	branch := self activeWorkingCopy createBranchNamed: name at: aCommit.
	aStringOrNil ifNotNil: [self checkSetUpstreamForCreatedBranch: branch to: aStringOrNil].
	^ branch