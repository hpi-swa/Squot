private
selectChangedArtifactsFrom: baseSnapshot
to: loadedSnapshot
title: titleString
ifCanceled: cancelBlock
	| builder tool view |
	tool := SquotChangedArtifactsChooserOnSnapshots from: baseSnapshot to: loadedSnapshot.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool controllerForIgnores: self.
	builder := ToolBuilder default.
	view := builder open: tool label: titleString.
	builder runModal: view.
	^ tool accepted
		ifTrue: [tool selectedChanges]
		ifFalse: [cancelBlock value]
	