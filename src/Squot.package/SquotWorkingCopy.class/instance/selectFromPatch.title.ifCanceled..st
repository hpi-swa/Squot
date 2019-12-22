private
selectFromPatch: aPatch title: titleString ifCanceled: cancelBlock
	| tool |
	(SquotSelectionOfChangesRequested new
		patch: aPatch;
		title: titleString;
		signal)
	ifNotNil: [:selectedPatch | ^ selectedPatch].
	tool := SquotChangedArtifactsChooser on: aPatch.
	tool workingCopy: self;
		"addIgnoredArtifacts: self ignoredArtifacts;"
		controllerForIgnores: self;
		requestSelectedChangesWithTitle: titleString.
	^ tool accepted
		ifTrue: [tool selectedPatch]
		ifFalse: [cancelBlock value]