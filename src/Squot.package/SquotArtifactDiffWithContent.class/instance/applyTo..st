patching
applyTo: anArtifact
	diffContent squotHasChanges ifFalse: [^ anArtifact].
	^ anArtifact copyWithDiffApplied: (SquotDiffNode title: '' content: nil children: topNodes)