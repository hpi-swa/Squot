testing
mayAffectArtifact
	"Answer whether I might change anything about the artifact."
	"Artifact loads are diffs, not merges, and they are the primary reason that this message exists."
	^ self hasChanges