dialog
validateDialogHasNoConflicts: aChangesDialog before: aBlock
	aChangesDialog hasConflicts ifTrue: [
		self inform: 'There are conflicts. Please resolve them before committing. Aborting.'.
		^ nil].
	^ aBlock value