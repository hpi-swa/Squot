running
merge
	"Initiate the merge of the prepared versions.
	Senders should handle SquotSelectionOfChangesRequested"
	self workingCopy
		mergeVersionInteractively: thirdVersion
		ifCanceled: [testCase fail: 'this code should not be reached'].