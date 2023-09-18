dialog
validateDialogState: aChangesDialogWithMessage
andOriginalHeadCommit: aCommit
before: aBlock
	self workingCopy headCommit = aCommit ifFalse: [
		self inform: 'These changes are outdated. Aborting.'.
		^ nil].
	aChangesDialogWithMessage hasConflicts ifTrue: [
		self inform: 'There are conflicts. Please resolve them before committing. Aborting.'.
		^ nil].
	aChangesDialogWithMessage message ifEmpty: [
		aChangesDialogWithMessage informEmptyMessage.
		^ nil].
	^ aBlock value