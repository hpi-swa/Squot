tools
createPatchEditorFor: client original: originalArtifact proposed: proposedArtifact
	^ content
		squotCreatePatchEditorFor: client
		original: (originalArtifact ifPresent: [originalArtifact content] ifAbsent: [MCSnapshot empty])
		proposed: proposedArtifact content