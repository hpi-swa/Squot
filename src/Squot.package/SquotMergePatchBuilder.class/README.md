I combine the artifacts with equal paths from three snapshots to form a patch during a merge.

The left side is assumed to be the target of the merge: the merge result will be stored there (or on top of it). The right side is assumed to be the edition that should be merged into the left side.

Note that the base edition is not necessarily a common ancestor of left and right editions.
During a cherry-pick, the base is just one parent edition of the right edition, for example.

If an artifact is unmodified between the base version and either side, then the differences to the other side should be kept.
When an artifact was modified on both sides then there are seven cases:
- left, right, and base all contain the artifact => merge the differences. If there are no differences on the left, just keep the ones on the right. If there are none on the right, there is nothing to apply.
- left and right contain the artifact, base does not => differences between the two additions are conflicts
- left and base contain the artifact, right does not => removed on the right, which conflicts with differences on the left side
- right and base contain the artifact, left does not => removed on the left, which conflicts with differences on the right side
- only base contains the artifact => mutually removed, nothing to apply
- only left contains the artifact => was added, nothing to apply
- only right contains the artifact => was added, keep the addition for applying

Instance Variables
	baseArtifacts:		<Dictionary> artifacts from the base version
	leftArtifacts:		<Dictionary> artifacts from the left version of a merge
	rightArtifacts:		<Dictionary> artifacts from the right version of a merge
	diffs:		<Dictionary> resulting diffs in the patch to be built
	fromBaseToExisting:		<SquotPatch> patch from base to left
	fromBaseToIncoming:		<SquotPatch> patch from base to right
