I combine the artifacts with equal paths from three snapshots to form a patch during a merge.

Instance Variables
	baseArtifacts:		<Dictionary> artifacts from the base version
	leftArtifacts:		<Dictionary> artifacts from the left version of a merge
	rightArtifacts:		<Dictionary> artifacts from the right version of a merge
	diffs:		<Dictionary> resulting diffs in the patch to be built
	fromBaseToExisting:		<SquotPatch> patch from base to left
	fromBaseToIncoming:		<SquotPatch> patch from base to right
