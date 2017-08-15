patching
applyDiff: aDiff toObjectAt: path
	| reference updatedArtifact |
	reference := directory resolve: path.
	self flag: #optimize. "avoid patching an artifact if the serializer supports writing a diff directly"
	self flag: 'TODO: handle additions and removals directly as such, to avoid dealing with absent artifacts in the methods invoked below'.
	updatedArtifact := (self restoreArtifactFrom: reference) copyWithDiffApplied: aDiff.
	self rememberArtifact: updatedArtifact.
	reference exists ifTrue: [reference deleteAll].
	self store: updatedArtifact.