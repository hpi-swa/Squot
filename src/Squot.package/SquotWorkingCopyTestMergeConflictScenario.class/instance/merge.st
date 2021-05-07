setUp
merge
	"Initiate the merge of the prepared versions.
	Senders should handle SquotSelectionOfChangesRequested"
	| operation |
	^ self repository withUnitOfWork:
		[(operation := self workingCopy newMergeOperation)
			mergeVersion: thirdVersion;
			prepare.
		operation].