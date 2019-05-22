accessing
updateRightArtifacts
	| snapshotBuilder |
	diffs do: [:each | each updateRightArtifact].
	snapshotBuilder := SquotSnapshot builder.
	patchedLoadOrder do:
		[:each | | patchedArtifact |
		patchedArtifact :=
			((diffs includesKey: each)
				ifTrue: [(diffs at: each) right]
				ifFalse: [base artifactAt: each ifAbsent: []]).
		patchedArtifact ifNotNil: [snapshotBuilder add: patchedArtifact]].
	patched := snapshotBuilder buildSnapshot.