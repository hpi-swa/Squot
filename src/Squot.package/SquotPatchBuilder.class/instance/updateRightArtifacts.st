accessing
updateRightArtifacts
	| snapshotBuilder |
	diffs do: [:each | each updateRightArtifact].
	"If an artifact addition was excluded, we must remove it from the patchedLoadOrder."
	((patchedLoadOrder copyWithoutAll: originalLoadOrder) copyWithoutAll: self paths) do:
		[:each | patchedLoadOrder remove: each].
	"If an artifact removal was excluded, we must readd it to the patchedLoadOrder."
	((originalLoadOrder copyWithoutAll: patchedLoadOrder) copyWithoutAll: self paths) do:
		[:each | self reinsertInLoadOrder: each].
	snapshotBuilder := SquotSnapshot builder.
	patchedLoadOrder do:
		[:each | | patchedArtifact |
		patchedArtifact :=
			((diffs includesKey: each)
				ifTrue: [(diffs at: each) right]
				ifFalse: [base artifactAt: each ifAbsent: []]).
		patchedArtifact ifNotNil: [snapshotBuilder add: patchedArtifact]].
	patched := snapshotBuilder buildSnapshot.