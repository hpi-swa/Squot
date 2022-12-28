tests merging
testMergeWithAddedArtifactOnBothSides
	| baseVersion leftId rightId leftVersion rightVersion leftName rightName operation versionMerge artifactMerge artifactConflict loadedArtifactId |
	repository withUnitOfWork:
	[self workingCopy saveVersionWithMessage: 'empty base version'.
	baseVersion := self workingCopy loadedHistorian version.
	self workingCopy add: (ValueHolder new contents: #right) at: 'added';
		saveVersionWithMessage: 'right-side version'.
	rightId := self workingCopy idOfObject: (self workingCopy objectAt: 'added').
	rightVersion := self workingCopy loadedHistorian version.
	rightName := store objectRegistry nameOf: (self workingCopy objectAt: 'added').
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy discardUnsavedChanges.
	self deny: (self workingCopy includesObjectAt: 'added').
	self workingCopy add: (ValueHolder new contents: #left) at: 'added';
		saveVersionWithMessage: 'left-side version'.
	leftId := self workingCopy idOfObject: (self workingCopy objectAt: 'added').
	leftVersion := self workingCopy loadedHistorian version.
	leftName := store objectRegistry nameOf: (self workingCopy objectAt: 'added').
	self assert: leftName ~= rightName.
	self assert: (leftVersion artifactAt: 'added') id ~= (rightVersion artifactAt: 'added') id.
	loadedArtifactId := (workingCopy artifactAt: 'added') id.
	self assert: (leftVersion artifactAt: 'added') id equals: loadedArtifactId.
	"merge the version of the other historian"
	versionMerge := (operation := self workingCopy newMergeOperation) 
		mergeVersion: rightVersion;
		prepare.
	SquotToggles useNewApi
		ifTrue:
			[artifactConflict := versionMerge conflictAt: leftId.
			artifactConflict chooseIncoming]
		ifFalse:
			[artifactMerge := versionMerge mergeAt: leftId.
			self assert: artifactMerge hasConflicts.
			(artifactMerge graphMerge conflictAt: (self workingCopy artifactAt: 'added') content startName) chooseIncoming].
	operation applyToWorkingCopy.
	self assert: #right equals: (self workingCopy objectAt: 'added') contents;
		assert: rightName equals:
			(store objectRegistry nameOf: (self workingCopy objectAt: 'added')).
	SquotToggles useNewApi
		ifTrue: [self assert: rightId equals: (workingCopy artifactAt: 'added') id]
		ifFalse: [self assert: loadedArtifactId equals: (workingCopy artifactAt: 'added') id].
	workingCopy saveVersionWithMessage: 'merge commit'.
	SquotToggles useNewApi
		ifTrue: [self assert: rightId equals: (workingCopy baseVersion artifactAt: 'added') id]
		ifFalse: [self assert: loadedArtifactId equals: (workingCopy baseVersion artifactAt: 'added') id]].