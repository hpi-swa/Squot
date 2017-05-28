private
selectFromPatch: aPatch title: titleString ifCanceled: cancelBlock
	| tool |
	(SquotSelectionOfChangesRequested new
		patch: aPatch;
		title: titleString;
		signal)
	ifNotNil: [:selectedPatch | ^ selectedPatch].
	tool := SquotChangedArtifactsChooser on: aPatch.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool controllerForIgnores: self.
	tool requestSelectedChangesWithTitle: titleString.
	^ tool accepted
		ifTrue: [tool selectedPatch]
		ifFalse: [cancelBlock value]