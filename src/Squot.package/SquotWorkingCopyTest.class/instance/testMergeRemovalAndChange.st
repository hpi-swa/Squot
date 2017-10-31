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
	on: SquotSelectionOfChangesRequested do: [:request | | conflict |
		"then"
		conflict := (request patch diffAt: 'text').
		self assert: conflict needsChoice.
		conflict chooseRight. "the changed text"
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}.
	self assert: 'Changed text' equals: (self workingCopy objectAt: 'text') string.