dialog
validateDialogState: aChangesDialogWithMessage
andOriginalHeadCommit: aCommit
before: aBlock
	self activeWorkingCopy headCommit = aCommit ifFalse: [
		self inform: 'These changes are outdated. Aborting.'.
		^ nil].
	^ self
		validateDialogHasNoConflicts: aChangesDialogWithMessage
		before: [
			aChangesDialogWithMessage message ifEmpty: [
				aChangesDialogWithMessage informEmptyMessage.
				^ nil].
			^ aBlock value]