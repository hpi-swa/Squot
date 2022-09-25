patching
copyWithDiffApplied: anArtifactModification
	| artifactCopy snapshotCopy |
	artifactCopy := SquotArtifact storeInfo: (anArtifactModification applyMetadataDiffTo: artifact storeInfo).
	snapshotCopy := anArtifactModification applyContentDiffTo: objectSnapshot.
	^ self class artifact: artifactCopy objectSnapshot: snapshotCopy