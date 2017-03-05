tools
createPatchEditorFor: client original: originalArtifact proposed: proposedArtifact
	^ self content
		squotCreatePatchEditorFor: client
		original: (originalArtifact ifPresent: [originalArtifact content] ifAbsent: [MCSnapshot empty])
		proposed: proposedArtifact content