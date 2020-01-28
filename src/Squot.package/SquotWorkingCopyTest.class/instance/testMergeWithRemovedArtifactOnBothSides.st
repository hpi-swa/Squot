tests
testMergeWithRemovedArtifactOnBothSides
	"When an artifact is removed in both branches, then merging them should let it stay removed without a conflict."
	| baseVersion leftVersion rightVersion |
	self workingCopy
		add: (ValueHolder new contents: #right) at: 'to-be-removed';
		saveVersionWithMessage: 'base version'.
	baseVersion := self workingCopy loadedHistorian version.
	self workingCopy
		removeAt: 'to-be-removed';
		saveVersionWithMessage: 'right-side version'.
	rightVersion := self workingCopy loadedHistorian version.
	self deny: (rightVersion includesObjectAt: 'to-be-removed').
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy discardUnsavedChanges.
	self assert: (self workingCopy includesObjectAt: 'to-be-removed').
	self workingCopy
		removeAt: 'to-be-removed';
		saveVersionWithMessage: 'left-side version'.
	leftVersion := self workingCopy loadedHistorian version.
	"when"
	[[self workingCopy mergeVersionInteractively: rightVersion
		ifCanceled: [self fail: 'This code should not be reached']]
	on: SquotMergeRequested do: [:request | 
		"then"
		self deny: (request merge modifies: (baseVersion artifactAt: 'to-be-removed')).
		self deny: request merge hasConflicts.
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}.
	self deny: (self workingCopy includesObjectAt: 'to-be-removed').