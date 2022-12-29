callbacks for references
removed: workingArtifactReflection at: pathCollection
	"There is no callback for objects that were removed (this one here is for references that were removed). They simply drop from the object graph. So detect here whether an artifact gets removed and check for conflicting modifications of it."
	| removedId baseSnapshot workingCopySnapshot patch |
	removedId := workingArtifactReflection object id.
	(incomingProjectSnapshot project includesArtifactWithId: removedId)
		ifTrue: "Just moved to a different path"
			[self assert: pathCollection last path ~= (incomingProjectSnapshot artifactAt: removedId) path.
			^ self].
	baseSnapshot := baseProjectSnapshot snapshotArtifact: (baseProjectSnapshot project artifactAt: removedId).
	workingCopySnapshot :=  workingProjectSnapshot snapshotArtifact: workingArtifactReflection object.
	patch := workingCopySnapshot patchRelativeToBase: baseSnapshot.
	patch hasChanges
		ifFalse: [removals add: (SquotArtifactRemoval of: workingArtifactReflection object)]
		ifTrue: [conflicts add: (SquotContainerConflict workingDiff: patch conflictingDiff: (SquotArtifactRemoval of: baseSnapshot artifact))].