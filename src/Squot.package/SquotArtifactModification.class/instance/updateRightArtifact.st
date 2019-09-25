accessing
updateRightArtifact
	"Since my content could have been changed, compute the effective right artifact."
	| oldRight rightMetadata |
	oldRight := right.
	rightMetadata := right storeInfo.
	right := left copyWithDiffApplied: self.
	right storeInfo: rightMetadata.