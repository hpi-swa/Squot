patching
applyDiff: aDiff toObjectAt: path
	| reference updatedArtifact storedArtifact |
	reference := directory resolve: path.
	reference exists ifFalse: [self error: 'Attempt to patch non-existent files'].
	self flag: #optimize. "avoid patching an artifact if the serializer supports writing a diff directly"
	updatedArtifact := aDiff right.
	reference exists ifTrue: [reference deleteAll].
	storedArtifact := self store: updatedArtifact.
	self rememberArtifact: storedArtifact.
	^ storedArtifact