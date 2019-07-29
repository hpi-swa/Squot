merging
resolveConflictWith: aSquotArtifactDiff
	"I am in conflict with another artifact diff (container conflict).
	The other diff was elected to be applied to the working copy.
	Answer an appropriate artifact diff that brings the working copy into the target state
	of the given artifact diff."
	self subclassResponsibility