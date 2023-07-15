building
compareWholeProjects
	mergeBuilder := SquotMergeBuilder client: self workingRoot: workingProjectSnapshot baseRoot: baseProjectSnapshot incomingRoot: incomingProjectSnapshot.
	mergeBuilder enqueueInstances: (SquotObjectReflection object: workingProjectSnapshot mirror: workingProjectSnapshot) base: (SquotObjectReflection object: baseProjectSnapshot mirror: baseProjectSnapshot) incoming: (SquotObjectReflection object: incomingProjectSnapshot mirror: incomingProjectSnapshot) reachedVia: nil.
	mergeBuilder walkUpToEnd.
	self flag: #todo. "progress notifications"
	metadataMerge := (SquotTrackedObjectMetadata newFrom: workingProjectSnapshot project metadata) squotMergeWith: (SquotTrackedObjectMetadata newFrom: incomingProjectSnapshot project metadata) basedOn: (SquotTrackedObjectMetadata newFrom: baseProjectSnapshot project metadata).
	"Clean up unnecessary items."
	merges removeAllSuchThat: [:each | each hasChanges not].