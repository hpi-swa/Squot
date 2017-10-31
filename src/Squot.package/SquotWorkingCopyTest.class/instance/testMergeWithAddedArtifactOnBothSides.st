tests
testMergeWithAddedArtifactOnBothSides
	| baseVersion leftVersion rightVersion |
	self workingCopy saveNewVersionMessage: 'empty base version' interactive: false.
	baseVersion := self workingCopy loadedHistorian version.
	self workingCopy add: 'Right side' at: 'added.txt';
		saveNewVersionMessage: 'right-side version' interactive: false.
	rightVersion := self workingCopy loadedHistorian version.
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy discardUnsavedChanges.
	self deny: (self workingCopy includesObjectAt: 'added.txt').
	self workingCopy add: 'Left side' at: 'added.txt';
		saveNewVersionMessage: 'left-side version' interactive: false.
	leftVersion := self workingCopy loadedHistorian version.
	"merge the version of the other historian"
	[[self workingCopy mergeVersionInteractively: rightVersion
		ifCanceled: [self fail: 'This code should not be reached']]
	on: SquotSelectionOfChangesRequested do: [:request | | diff |
		diff := request patch diffAt: 'added.txt'.
		self assert: diff squotHasConflicts.
		diff content startDiff chooseRight.
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}.
	self assert: 'Right side' equals: (self workingCopy objectAt: 'added.txt').