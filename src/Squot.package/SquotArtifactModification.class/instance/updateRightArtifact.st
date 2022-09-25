accessing
updateRightArtifact
	"Since my content could have been changed, compute the effective right artifact."
	| oldRight |
	oldRight := right.
	right := left copyWithDiffApplied: self.