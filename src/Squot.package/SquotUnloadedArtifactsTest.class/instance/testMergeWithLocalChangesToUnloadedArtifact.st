tests
testMergeWithLocalChangesToUnloadedArtifact
	"Regression test: local changes to unloaded artifacts must not be reverted during a merge if the incoming version of the artifact is not changed."
	| incoming artifactSnapshot |
	workingCopy add: ValueHolder new at: 'object'.
	workingCopy
		saveVersionWithMessage: 'Add object';
		saveVersionWithMessage: 'Dummy incoming version'.
	incoming := workingCopy baseVersion.
	"Reset to first version"
	workingCopy loadedHistorian version: workingCopy baseVersion parents first.
	workingCopy loadedVersion: workingCopy baseVersion.
	"Change object, then unload"
	(workingCopy objectAt: 'object') contents: 1.
	workingCopy saveVersionWithMessage: 'Change object'.
	artifactSnapshot := (store artifactAt: 'object') capture.
	workingCopy
		removeAt: 'object';
		addUnloaded: artifactSnapshot.
	"when"
	workingCopy newMergeOperation
		mergeVersion: incoming;
		prepare;
		applyToWorkingCopy.
	"then"
	self deny: ((workingCopy artifactAt: 'object') diffAgainst: artifactSnapshot) hasChanges.