creating new versions
selectChangedArtifactsFrom: baseSnapshot to: loadedSnapshot title: titleString
	| builder tool view |
	tool := SquotChangedArtifactsChooser from: baseSnapshot to: loadedSnapshot.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool initializeSelectedChangesWithProposedChanges.
	tool controllerForIgnores: self.
	builder := ToolBuilder default.
	view := builder open: tool label: titleString.
	builder runModal: view.
	^ tool accepted
		ifTrue: [tool selectedChanges]
		ifFalse: [nil]
	