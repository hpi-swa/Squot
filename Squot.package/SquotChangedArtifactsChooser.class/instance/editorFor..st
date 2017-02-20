editing artifacts
editorFor: anArtifact
	^ anArtifact
		createPatchEditorFor: self
		original: (self originalOf: anArtifact)
		proposed: (self proposedOf: anArtifact)