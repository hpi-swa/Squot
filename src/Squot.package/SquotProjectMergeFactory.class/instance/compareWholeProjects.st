building
compareWholeProjects
	| incomingIds |
	mergeBuilder := SquotMergeBuilder client: self workingRoot: workingProjectSnapshot baseRoot: baseProjectSnapshot incomingRoot: incomingProjectSnapshot.
	
	mergeBuilder enqueueInstances: (SquotObjectReflection object: workingProjectSnapshot mirror: workingProjectSnapshot) base: (SquotObjectReflection object: baseProjectSnapshot mirror: baseProjectSnapshot) incoming: (SquotObjectReflection object: incomingProjectSnapshot mirror: incomingProjectSnapshot) reachedVia: nil.
	mergeBuilder walkUpToEnd.

	[incomingIds := OrderedCollection new.
	self flag: #todo. "progress notifications"
	incomingArtifactsMapping keys do:
		[:eachIncomingArtifact |
		incomingIds add: eachIncomingArtifact id.
		self compareConsolidatedIncomingArtifact: eachIncomingArtifact].
	(workingProjectSnapshot project artifacts keys copyWithoutAll: incomingIds)
		do: [:eachRemovedId |
			(baseProjectSnapshot project includesArtifactWithId: eachRemovedId)
				ifTrue: "Check whether the working copy has any changes to be lost"
					[| baseSnapshot workingCopySnapshot patch |
					baseSnapshot := baseProjectSnapshot snapshotArtifact: (baseProjectSnapshot project artifactAt: eachRemovedId).
					workingCopySnapshot :=  workingProjectSnapshot snapshotArtifact: (workingProjectSnapshot project artifactAt: eachRemovedId).
					patch := workingCopySnapshot patchRelativeToBase: baseSnapshot.
					patch hasChanges
						ifFalse: [removals add: (SquotArtifactRemoval of: (workingProjectSnapshot project artifacts at: eachRemovedId))]
						ifTrue: [conflicts add: (SquotContainerConflict workingDiff: patch conflictingDiff: (SquotArtifactRemoval of: baseSnapshot artifact))]]
				ifFalse: ["Keep artifact that was added in the history of the working copy."]]].

	loadOrderMerge := SquotLoadOrderMerge into: workingProjectSnapshot project artifacts keys merge: (incomingArtifactsMapping keys collect: [:each | each id]) basedOn: baseProjectSnapshot project artifacts keys.
	metadataMerge := (SquotTrackedObjectMetadata newFrom: workingProjectSnapshot project metadata) squotMergeWith: (SquotTrackedObjectMetadata newFrom: incomingProjectSnapshot project metadata) basedOn: (SquotTrackedObjectMetadata newFrom: baseProjectSnapshot project metadata).