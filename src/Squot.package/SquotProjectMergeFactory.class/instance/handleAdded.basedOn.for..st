callbacks
handleAdded: incomingObjectReflection basedOn: baseObjectReflection for: aMergeBuilder
	"Irrelevant for project merges because metadata and artifact data are trees. Only becomes relevant for the graphs inside of each artifact, but they should be merged separately."