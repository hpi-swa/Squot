accessing artifacts
updateArtifact: anArtifactMerge
	"Update the artifact in storage according to the merge instructions."
	| existing patch new |
	anArtifactMerge hasChanges ifFalse: [^ self].
	existing := artifactSnapshots at: anArtifactMerge incoming artifact id.
	patch := anArtifactMerge resolvedPatch.
	new := SquotArtifactSnapshot
		artifact: (SquotArtifact storeInfo: (patch metadata squotApplyTo: existing artifact storeInfo))
		objectSnapshot: (patch content squotApplyTo: existing objectSnapshot).
	artifactSnapshots at: anArtifactMerge incoming artifact id put: new.
	^ new