*Squot-Tools applying
saveInteractively
	self saveOperation message ifNil:
		[self saveOperation 	message:
			pickedVersion message,
				String cr, String cr,
				'(cherry-picked from commit ', pickedVersion internalId, ')'].
	^ (self saveOperation
		patch: loadedPatch;
		title: 'Select changes and message for the new version';
		requestor: self requestor;
		applyToWorkingCopy)
			then: [:newVersion | newVersion]
			ifRejected:
				[:reason |
				self requestor getShouldRevertCherryPickedChanges ifTrue:
					[self revertMerge "captured snapshot used here"].
				'Save was cancelled']