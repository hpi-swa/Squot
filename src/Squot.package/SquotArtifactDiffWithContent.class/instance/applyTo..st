patching
applyTo: anArtifact
	diffContent squotHasChanges ifFalse: [^ anArtifact].
	anArtifact ifAbsent: [^ anArtifact copyWithDifferentContent: right content].
	^ anArtifact copyWithDiffApplied: (SquotDiffNode title: '' content: nil children: topNodes)