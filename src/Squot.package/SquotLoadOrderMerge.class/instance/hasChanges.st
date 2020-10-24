testing
hasChanges
	"This cannot be definitely answered until conflict resolutions of the container merge have been applied to me. For example, incoming changes might remove an artifact, but the working copy has changes to it. The artifact will only be removed from the load order (which makes a change to the order) if the user decides to remove the artifact and discard the changes."
	^ containerConflicts notEmpty or: [containerModifications notEmpty or: [(resolvedPatch ifNil: [self resolvedPatch]) squotHasChanges]]