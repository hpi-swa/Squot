merging
resolveConflictByPatching: anArtifact
	self isThisEverCalled: 'Two artifact modifications should not cause a container conflict.'.
	^ anArtifact diffAgainst: self right