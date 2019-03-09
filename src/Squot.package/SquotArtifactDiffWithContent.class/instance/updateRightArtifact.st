accessing
updateRightArtifact
	"Since my content could have been changed, compute the effective right artifact."
	right := left copyWithDiffApplied: self.