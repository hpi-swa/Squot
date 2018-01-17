testing
couldBeMergedWith: anArtifactDiff
	"Can only be merged with other removals."
	^ anArtifactDiff species = self species