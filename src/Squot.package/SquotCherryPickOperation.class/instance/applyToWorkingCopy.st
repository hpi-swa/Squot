applying
applyToWorkingCopy
	"Execute the cherry pick."
	self withUnitOfWork:
	[self validate.
	SquotToggles useNewApi
		ifTrue:
			[self workingCopySnapshot: (SquotProjectSnapshot fromStore: self workingCopy).
			self prepareMerge; applyMerge]
		ifFalse:
			[self workingCopy withCurrentSnapshot:
				[self
					prepareMerge;
					applyMerge]].
	self save].