tests merging
testMergeWithAddedArtifactOnBothSides
	| baseVersion leftVersion rightVersion leftName rightName operation versionMerge artifactMerge |
	repository withUnitOfWork:
	[self workingCopy saveVersionWithMessage: 'empty base version'.
	baseVersion := self workingCopy loadedHistorian version.
	self workingCopy add: (ValueHolder new contents: #right) at: 'added';
		saveVersionWithMessage: 'right-side version'.
	rightVersion := self workingCopy loadedHistorian version.
	rightName := store objectRegistry nameOf: (self workingCopy objectAt: 'added').
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy discardUnsavedChanges.
	self deny: (self workingCopy includesObjectAt: 'added').
	self workingCopy add: (ValueHolder new contents: #left) at: 'added';
		saveVersionWithMessage: 'left-side version'.
	leftVersion := self workingCopy loadedHistorian version.
	leftName := store objectRegistry nameOf: (self workingCopy objectAt: 'added').
	self assert: leftName ~= rightName.
	"merge the version of the other historian"
	versionMerge := (operation := self workingCopy newMergeOperation) 
		mergeVersion: rightVersion;
		prepare.
	artifactMerge := versionMerge mergeAt: 'added'.
	self assert: artifactMerge hasConflicts.
	(artifactMerge graphMerge conflictAt: (self workingCopy artifactAt: 'added') content startName) chooseIncoming.
	operation applyToWorkingCopy.
	self assert: #right equals: (self workingCopy objectAt: 'added') contents;
		assert: rightName equals:
			(store objectRegistry nameOf: (self workingCopy objectAt: 'added'))].