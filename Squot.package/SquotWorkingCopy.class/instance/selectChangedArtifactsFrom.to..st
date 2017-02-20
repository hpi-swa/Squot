creating new versions
selectChangedArtifactsFrom: baseSnapshot to: loadedSnapshot
	| builder tool view |
	tool := SquotChangedArtifactsChooser from: baseSnapshot to: loadedSnapshot.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool initializeSelectedChangesWithProposedChanges.
	tool controllerForIgnores: self.
	builder := ToolBuilder default.
	view := builder open: tool label: 'Select changes to be saved'.
	builder runModal: view.
	^ tool canceled
		ifFalse: [tool selectedChanges]
		ifTrue: [nil]
	