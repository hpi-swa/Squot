accessing
updateRightArtifact
	"Since my content could have been changed, compute the effective right artifact."
	| oldRight rightMetadata |
	oldRight := right.
	self flag: #todo. "This keeping of the right storeInfo is required because that is the object edited in the tools, see SquotArtifactModification>>metadataTreeNodes."
	rightMetadata := right storeInfo.
	right := left copyWithDiffApplied: self.
	right storeInfo: rightMetadata.