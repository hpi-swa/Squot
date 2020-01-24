applying
chooseChanges
	| tool |
	tool := (SquotSaveVersionDialog on: self patch)
		parentVersions: self parentVersions;
		workingCopy: self;
		controllerForIgnores: self;
		yourself.
	self message ifNotNil: [tool message: self message].
	^ (tool selectedChangesWithTitle: self title)
		then: [:ignored |
			tool messageWasChanged
				ifTrue: [self workingCopy newVersionMessage: tool message asString.
			tool selectedPatch]]
		ifRejected: [:ignored |
			tool messageWasChanged
				ifTrue: [self workingCopy newVersionMessage: tool message asString].
			'Save was canceled']