patching
applyDiff: aDiff toObjectAt: path
	| reference updatedArtifact |
	reference := directory resolve: path.
	self flag: #optimize. "avoid patching an artifact if the serializer supports writing a diff directly"
	updatedArtifact := (self restoreArtifactFrom: reference) copyWithDiffApplied: aDiff.
	self rememberArtifact: updatedArtifact.
	reference exists ifTrue: [reference deleteAll].
	self store: updatedArtifact.