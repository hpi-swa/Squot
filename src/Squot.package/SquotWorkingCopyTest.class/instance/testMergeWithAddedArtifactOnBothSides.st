tests
testMergeWithAddedArtifactOnBothSides
	| baseVersion leftVersion rightVersion |
	self workingCopy saveNewVersionMessage: 'empty base version' interactive: false.
	baseVersion := self workingCopy loadedHistorian version.
	self workingCopy add: (ValueHolder new contents: #right) at: 'added';
		saveNewVersionMessage: 'right-side version' interactive: false.
	rightVersion := self workingCopy loadedHistorian version.
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy discardUnsavedChanges.
	self deny: (self workingCopy includesObjectAt: 'added').
	self workingCopy add: (ValueHolder new contents: #left) at: 'added';
		saveNewVersionMessage: 'left-side version' interactive: false.
	leftVersion := self workingCopy loadedHistorian version.
	"merge the version of the other historian"
	[[self workingCopy mergeVersionInteractively: rightVersion
		ifCanceled: [self fail: 'This code should not be reached']]
	on: SquotMergeRequested do: [:request | | merge |
		merge := request merge mergeAt: 'added'.
		self assert: merge hasConflicts.
		(merge graphMerge conflictAt: (self workingCopy artifactAt: 'added') content startName) chooseIncoming.
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}.
	self assert: #right equals: (self workingCopy objectAt: 'added') contents.