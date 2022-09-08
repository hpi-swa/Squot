applying
chooseChanges
	| tool |
	tool := (SquotSaveVersionDialog on: self patch)
		parentVersions: self parentVersions;
		workingCopy: self workingCopy;
		controllerForIgnores: self;
		yourself.
	self message ifNotNil: [tool message: self message].
	^ (tool selectedChangesWithTitle: self title)
		then: [:ignored |
			self workingCopy newVersionMessage: tool message asString.
			self message: tool message asString.
			tool selectedPatch]
		ifRejected: [:ignored |
			self workingCopy newVersionMessage: tool message asString.
			Promise new rejectWith: 'Save was cancelled']