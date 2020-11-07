accessing
updateRightArtifacts
	| snapshotBuilder |
	self loadOrderMerge resetAppliedDiffs.
	diffs do: [:each |
			each updateRightArtifact.
			self loadOrderMerge applyDiff: each. "Applies removals and additions"].
	snapshotBuilder := SquotSnapshot builder.
	((self loadOrderMerge
		detectConflicts;
		chooseIncoming;
		resolvedPatch)
		applyTo: originalLoadOrder)
		do:
			[:each | | patchedArtifact |
			patchedArtifact :=
				((diffs includesKey: each)
					ifTrue: [(diffs at: each) right]
					ifFalse: [base artifactAt: each ifAbsent: []]).
			patchedArtifact ifNotNil: [snapshotBuilder add: patchedArtifact]].
	patched := snapshotBuilder buildSnapshot.