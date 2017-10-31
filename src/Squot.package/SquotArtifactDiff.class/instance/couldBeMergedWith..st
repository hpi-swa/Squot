testing
couldBeMergedWith: anArtifactDiff
	"Answer whether a merge with the other diff is at all possible.
	Return false only if the artifact changes are as a whole in conflict."
	^ anArtifactDiff isRemoval not