*Squot-Tools applying
applyToWorkingCopyInteractively
	"Execute the cherry pick."
	self validateRequestor.
	self prepareMerge. "capture lazy snapshot here"
	merge applyToWorkingCopyInteractively
		whenRejected: [:reason | self resultPromise rejectWith: reason];
		whenResolved:
			[| newVersion |
			loadedPatch := merge appliedPatch.
			[newVersion := self workingCopy
				saveNewVersionFromPatch: loadedPatch
				ifCanceled:
					[self requestor getShouldRevertCherryPickedChanges ifTrue:
						[self revertMerge "captured snapshot used here"].
					self resultPromise reject: 'Save was cancelled']]
				on: SquotInitialLogMessageRequested
				do: [:request | request resume:
					pickedVersion message,
					String cr, String cr,
					'(cherry-picked from commit ', pickedVersion internalId, ')'].
			self resultPromise resolveWith: newVersion].
	^ self resultPromise