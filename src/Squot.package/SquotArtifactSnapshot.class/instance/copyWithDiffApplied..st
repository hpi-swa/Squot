patching
copyWithDiffApplied: anArtifactModification
	| artifactCopy patchedSnapshot |
	artifactCopy := SquotArtifact storeInfo: (anArtifactModification applyMetadataDiffTo: artifact storeInfo).
	patchedSnapshot := anArtifactModification applyContentDiffTo: objectSnapshot.
	^ self class artifact: artifactCopy objectSnapshot: patchedSnapshot