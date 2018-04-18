patching
mergeWithRemoval: anArtifactRemoval
	"Inverse case is in SquotArtifactDiff>>mergeWithAddition:"
	"double dispatch, initiated by #mergeWith:"
	self error: 'Cannot merge additon with removal'.
	"In fact, this should not be invoked, since there is a contradiction: according to me, the base version did not contain the artifact, but according to the other side, it did.
	It is likely an error further up in the call stack."