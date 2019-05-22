patching
applyDiff: aDiff toObjectAt: path
	| reference updatedArtifact |
	reference := directory resolve: path.
	reference exists ifFalse: [self error: 'Attempt to patch non-existent files'].
	self flag: #optimize. "avoid patching an artifact if the serializer supports writing a diff directly"
	updatedArtifact := aDiff right.
	self rememberArtifact: updatedArtifact.
	reference exists ifTrue: [reference deleteAll].
	self store: updatedArtifact.