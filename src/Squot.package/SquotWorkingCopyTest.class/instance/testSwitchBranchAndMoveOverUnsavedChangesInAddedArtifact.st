tests branch switching
testSwitchBranchAndMoveOverUnsavedChangesInAddedArtifact
	| text originalHistorian otherHistorian hadConflicts |
	"given"
	repository withUnitOfWork:
	[self workingCopy saveVersionWithMessage: 'empty base version'.
	originalHistorian := workingCopy loadedHistorian.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: originalHistorian version.
	self workingCopy loadedHistorian: otherHistorian.
	self workingCopy saveVersionWithMessage: 'still empty other version'.
	self workingCopy
		loadedHistorian: originalHistorian;
		add: (text := ValueHolder new contents: 'added text') at: 'text';
		saveVersionWithMessage: 'add text'.
	text contents: 'changed text'.
	hadConflicts := false.
	[workingCopy switchAndMoveUnsavedChangesOverTo: otherHistorian]
	on: SquotMergeRequested doAndResume: [:request |
		hadConflicts := true.
		self assert: request merge hasConflicts.
		request merge conflicts do: #chooseIncoming].
	self assert: hadConflicts description: 'should have detected a conflict'.
	self assert: 'changed text' equals: (workingCopy objectAt: 'text') contents].