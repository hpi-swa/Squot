tests unloaded artifacts
testLoadedArtifactsNotAdornedAsUnloaded
	| path patch |
	path := 'changed-artifact'.
	tool := self newToolOn: (patch := self patchChangingArtifactAt: path).
	tool selectNode: tool rootNodes first.
	self deny: ('*(*not loaded*)*' match: (tool nodeLabelOf: tool selectedNode)).