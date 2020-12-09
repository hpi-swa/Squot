tests
testMetadataModification
	| original changed diff |
	original := self createWorkingCopyWithObjectAt: 'obj'.
	(workingCopy store metadataForObjectAt: 'obj') at: #dummy put: 1.
	changed := (workingCopy artifactAt: 'obj') snapshot.
	diff := original diffAgainst: changed.
	self assert: diff mayAffectArtifact.