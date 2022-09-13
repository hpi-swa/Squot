tests
testPatchingPreservesIdOfWorkingCopy
	| original changed diff new originalId |
	original := self createWorkingCopyWithObjectAt: 'obj'.
	originalId := original id.
	(workingCopy store metadataForObjectAt: 'obj') at: #dummy put: 1.
	changed := (workingCopy artifactAt: 'obj') snapshot.
	changed id: UUID new.
	diff := original diffAgainst: changed.
	self assert: diff mayAffectArtifact.
	new := original copyWithDiffApplied: diff.
	self assert: originalId equals: new id.