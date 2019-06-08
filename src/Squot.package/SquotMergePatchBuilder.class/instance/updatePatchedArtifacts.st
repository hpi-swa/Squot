public
updatePatchedArtifacts
	| snapshotBuilder |
	diffs do: [:each | each hasConflicts ifFalse: [each updateRightArtifact]].
	snapshotBuilder := SquotSnapshot builder.
	rightLoadOrder do:
		[:each | | patchedArtifact|
		patchedArtifact :=
			((diffs includesKey: each)
				ifTrue: [(diffs at: each) right]
				ifFalse: [existingContainer artifactAt: each ifAbsent: []]).
		patchedArtifact ifNotNil: [snapshotBuilder add: patchedArtifact]].
	patchedContainer := snapshotBuilder buildSnapshot.