applying
applyToWorkingCopy
	"Execute the cherry pick."
	self validateAncestry; validateSave.
	self workingCopy withCurrentSnapshot:
		[self
			prepareMerge;
			applyMerge].
	self save.