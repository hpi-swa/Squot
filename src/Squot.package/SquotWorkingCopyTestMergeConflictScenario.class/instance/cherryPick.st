merging
cherryPick
	self repository withUnitOfWork:
	[[self workingCopy
		cherryPickInteractivelyFromVersion: thirdVersion
		withParent: firstVersion
		ifLoadCanceled: [testCase fail: 'this code should not be reached']
		ifSaveCanceled: [testCase fail: 'this code should not be reached']]
		on: Deprecation do: [:e | e resume]]