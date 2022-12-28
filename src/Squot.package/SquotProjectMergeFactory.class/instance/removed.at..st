callbacks
removed: workingArtifactReflection at: pathCollection
	| removedId baseSnapshot workingCopySnapshot patch |
	removedId := workingArtifactReflection object id.
	baseSnapshot := baseProjectSnapshot snapshotArtifact: (baseProjectSnapshot project artifactAt: removedId).
	workingCopySnapshot :=  workingProjectSnapshot snapshotArtifact: (workingProjectSnapshot project artifactAt: removedId).
	patch := workingCopySnapshot patchRelativeToBase: baseSnapshot.
	patch hasChanges
		ifFalse: [removals add: (SquotArtifactRemoval of: workingArtifactReflection object)]
		ifTrue: [conflicts add: (SquotContainerConflict workingDiff: patch conflictingDiff: (SquotArtifactRemoval of: baseSnapshot artifact))].