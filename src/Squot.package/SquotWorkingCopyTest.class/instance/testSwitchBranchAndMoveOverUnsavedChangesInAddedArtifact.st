tests
testSwitchBranchAndMoveOverUnsavedChangesInAddedArtifact
	| text originalHistorian otherHistorian hadConflicts |
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
	hadConflicts := false.
	[workingCopy switchAndMoveUnsavedChangesOverTo: otherHistorian]
	on: SquotConflictResolutionRequested doAndResume: [:request |
		hadConflicts := true.
		self assert: request patch hasConflicts.
		(request patch diffs detect: #hasConflicts) chooseRight].
	self assert: hadConflicts description: 'should have detected a conflict'.
	self assert: 'changed text' equals: (workingCopy objectAt: 'text') string.