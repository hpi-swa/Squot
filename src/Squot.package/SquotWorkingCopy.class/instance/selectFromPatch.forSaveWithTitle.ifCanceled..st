creating new versions
selectFromPatch: aPatch forSaveWithTitle: titleString ifCanceled: cancelBlock
	| tool signal message |
	((signal := SquotSelectionOfChangesForSaveRequested new)
		patch: aPatch;
		title: titleString;
		message: (message := self newVersionMessage);
		signal)
	ifNotNil: [:selectedPatch |
				self newVersionMessage: signal message.
				^ selectedPatch].
	tool := SquotSaveVersionDialog new
		parentVersions: self parentVersions;
		patch: aPatch;
		controllerForIgnores: self;
		yourself.
	message ifNotEmpty: [tool message: message].
	tool requestSelectedChangesWithTitle: titleString.
	tool messageWasChanged ifTrue:
		[self newVersionMessage: tool message asString].
	^ tool accepted
		ifTrue: [	tool selectedPatch]
		ifFalse: [cancelBlock value]