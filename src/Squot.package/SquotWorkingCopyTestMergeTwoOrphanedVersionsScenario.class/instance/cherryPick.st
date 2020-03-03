running
cherryPick
	"Initiate the cherry-pick of the first version.
	Senders should handle SquotSelectionOfChangesRequested"
	self repository withUnitOfWork:
		[self workingCopy
			cherryPickInteractivelyFromVersion: firstVersion
			withParent: nil "there is no parent"
			ifLoadCanceled: [testCase fail: 'this block should not be reached']
			ifSaveCanceled: [testCase fail: 'this block should not be reached']].