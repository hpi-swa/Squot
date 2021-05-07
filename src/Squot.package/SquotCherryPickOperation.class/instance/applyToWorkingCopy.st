applying
applyToWorkingCopy
	"Execute the cherry pick."
	self withUnitOfWork:
	[self validate.
	self workingCopy withCurrentSnapshot:
		[self
			prepareMerge;
			applyMerge].
	self save].