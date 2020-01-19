*Squot-Tools applying
saveInteractively
	| promise newVersion |
	promise := Promise new.	
	[newVersion := self workingCopy
		saveNewVersionFromPatch: loadedPatch
		ifCanceled:
			[self requestor getShouldRevertCherryPickedChanges ifTrue:
				[self revertMerge "captured snapshot used here"].
			^ promise rejectWith: 'Save was cancelled']]
		on: SquotInitialLogMessageRequested
		do: [:request | request resume:
			pickedVersion message,
			String cr, String cr,
			'(cherry-picked from commit ', pickedVersion internalId, ')'].
	^ promise resolveWith: newVersion