running
oldMerge
	"Initiate the merge of the prepared versions.
	Senders should handle SquotSelectionOfChangesRequested"
	self repository withUnitOfWork:
		[self workingCopy
			mergeVersionInteractively: firstVersion
			ifCanceled: [testCase fail: 'this code should not be reached']].