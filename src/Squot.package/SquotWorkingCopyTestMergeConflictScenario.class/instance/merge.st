setUp
merge
	"Initiate the merge of the prepared versions.
	Senders should handle SquotSelectionOfChangesRequested"
	self repository withUnitOfWork:
		[self workingCopy
			mergeVersionInteractively: thirdVersion
			ifCanceled: [testCase fail: 'this code should not be reached']].