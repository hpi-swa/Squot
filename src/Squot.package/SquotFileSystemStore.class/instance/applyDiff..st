patching
applyDiff: anArtifactDiff
	| reference updatedArtifact |
	anArtifactDiff hasChanges ifFalse: [^ self].
	reference := directory resolve: anArtifactDiff path.
	anArtifactDiff right
		ifPresent:
			[self flag: #todo. "avoid patching an artifact if the serializer supports writing a diff directly"
			updatedArtifact := (self restoreArtifactFrom: reference) copyWithDiffApplied: anArtifactDiff.
			reference deleteAll.
			self store: updatedArtifact]
		ifAbsent: [self removeFilesFrom: anArtifactDiff path].