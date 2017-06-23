creating new versions
selectChangedArtifactsFrom: baseSnapshot
to: loadedSnapshot
title: titleString
ifCanceled: cancelBlock
	| tool |
	(SquotSelectionOfChangesRequested new
		originalSnapshot: baseSnapshot;
		proposedSnapshot: loadedSnapshot;
		title: titleString;
		signal)
	ifNotNil: [:selectedArtifacts | ^ selectedArtifacts].
	tool := SquotChangedArtifactsChooser from: baseSnapshot to: loadedSnapshot.
	"tool addIgnoredArtifacts: self ignoredArtifacts."
	tool controllerForIgnores: self.
	tool requestSelectedChangesWithTitle: titleString.
	^ tool accepted
		ifTrue: [tool selectedChanges]
		ifFalse: [cancelBlock value]
	