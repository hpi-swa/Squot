accessing
updateRightArtifact
	"Since my content could have been changed, compute the effective right artifact."
	| rightMetadata |
	rightMetadata := right storeInfo.
	right := left copyWithDiffApplied: self.
	right storeInfo: rightMetadata.