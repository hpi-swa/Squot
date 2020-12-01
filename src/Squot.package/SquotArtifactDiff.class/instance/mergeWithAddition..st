merging
mergeWithAddition: anArtifactAddition
	"Inverse case is in SquotArtifactAdditon>>#mergeWithDiff: and SquotArtifactAddition>>#mergeWithRemoval:"
	"double dispatch, initiated by #mergeWith:"
	self error: 'Cannot merge additon with modification or removal'.
	"In fact, this should not be invoked, since there is a contradiction: according to me, the base version contained the artifact, but according to the other side, it did not.
	It is likely an error further up in the call stack."