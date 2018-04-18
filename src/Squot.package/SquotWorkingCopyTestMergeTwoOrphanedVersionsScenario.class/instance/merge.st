running
merge
	"Initiate the merge of the prepared versions.
	Senders should handle SquotSelectionOfChangesRequested"
	self workingCopy
		mergeVersionInteractively: firstVersion
		ifCanceled: [self fail: 'this code should not be reached'].