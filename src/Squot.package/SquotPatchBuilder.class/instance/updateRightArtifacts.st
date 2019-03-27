accessing
updateRightArtifacts
	| snapshotBuilder |
	diffs do: [:each | each updateRightArtifact].
	snapshotBuilder := SquotSnapshot builder.
	patchedLoadOrder do:
		[:each |
		snapshotBuilder add:
			((diffs includesKey: each)
				ifTrue: [(diffs at: each) right]
				ifFalse: [base artifactAt: each])].
	patched := snapshotBuilder buildSnapshot.