tests
testMetadataModification
	| original changed diff new |
	original := self createWorkingCopyWithObjectAt: 'obj'.
	(workingCopy store metadataForObjectAt: 'obj') at: #dummy put: 1.
	changed := (workingCopy artifactAt: 'obj') snapshot.
	diff := original diffAgainst: changed.
	self assert: diff mayAffectArtifact.
	new := original copyWithDiffApplied: diff. "This message is only used by snapshots, so this test case currently really needs to exist per object container type."
	self deny: (changed diffAgainst: new) mayAffectArtifact.