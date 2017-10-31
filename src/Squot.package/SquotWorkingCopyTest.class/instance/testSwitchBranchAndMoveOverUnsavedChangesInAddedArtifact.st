tests
testSwitchBranchAndMoveOverUnsavedChangesInAddedArtifact
	| text originalHistorian otherHistorian |
	"given"
	self workingCopy saveNewVersionMessage: 'empty base version' interactive: false.
	originalHistorian := workingCopy loadedHistorian.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: originalHistorian version.
	self workingCopy loadedHistorian: otherHistorian.
	self workingCopy saveNewVersionMessage: 'still empty other version' interactive: false.
	self workingCopy
		loadedHistorian: originalHistorian;
		add: (text := Text fromString: 'added text') at: 'text';
		saveNewVersionMessage: 'add text' interactive: false.
	text replaceFrom: 1 to: text size with: 'changed text'.
	workingCopy switchAndMoveUnsavedChangesOverTo: otherHistorian.
	self halt. "what to expect?"
	"Git solution: offer the choice between all or nothing"