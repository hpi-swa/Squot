tests
testMergeRemovalAndChange
	| text baseVersion leftVersion rightVersion |
	"given"
	self workingCopy add: (text := Text fromString: 'Base text') at: 'text'.
	self workingCopy saveNewVersionMessage: 'base version' interactive: false.
	baseVersion := self workingCopy loadedHistorian version.
	text replaceFrom: 1 to: text size with: 'Changed text'.
	self workingCopy saveNewVersionMessage: 'right-side version' interactive: false.
	rightVersion := self workingCopy loadedHistorian version.
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy
		discardUnsavedChanges;
		remove: text.
	self workingCopy saveNewVersionMessage: 'left-side version' interactive: false.
	leftVersion := self workingCopy loadedHistorian version.
	"when"
	[[self workingCopy mergeVersionInteractively: rightVersion
		ifCanceled: [self fail: 'This code should not be reached']]
	on: SquotMergeRequested do: [:request | | conflict |
		"then"
		conflict := request merge conflictAt: 'text'.
		self assert: conflict isResolved not.
		conflict chooseIncoming. "the changed text"
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}.
	self assert: 'Changed text' equals: (self workingCopy objectAt: 'text') string.