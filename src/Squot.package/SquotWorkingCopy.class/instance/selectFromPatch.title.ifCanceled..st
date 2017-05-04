private
selectFromPatch: aPatch title: titleString ifCanceled: cancelBlock
	| tool builder view |
	tool := SquotChangedArtifactsChooser on: aPatch.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool controllerForIgnores: self.
	builder := ToolBuilder default.
	view := builder open: tool label: titleString.
	builder runModal: view.
	^ tool accepted
		ifTrue: [tool selectedPatch]
		ifFalse: [cancelBlock value]