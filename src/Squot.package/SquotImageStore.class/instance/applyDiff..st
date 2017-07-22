patching
applyDiff: anArtifactDiff
	self activateObjectRegistryDuring: [anArtifactDiff applyToContainer: self].