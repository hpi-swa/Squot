applying
applyToWorkingCopy
	"Execute the cherry pick."
	self withUnitOfWork:
	[self validateAncestry; validateSave.
	self workingCopy withCurrentSnapshot:
		[self
			prepareMerge;
			applyMerge].
	self save].