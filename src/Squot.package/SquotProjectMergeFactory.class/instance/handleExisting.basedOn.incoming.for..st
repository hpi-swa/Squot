callbacks
handleExisting: workingObjectReflection basedOn: baseObjectReflection incoming: incomingObjectReflection for: aMergeBuilder
	"For project merges, the scope (whole project or single artifact) of the followed references can be controlled from the outside!"
	self shouldBeImplemented. "Delegate to merge scope."
	aMergeBuilder followAllReferencesOfCurrentInstances.