*Squot-tools
squotCreatePatchEditorFor: client original: originalSnapshot proposed: proposedSnapshot
	^ SquotPatchEditorForMCSnapshot
		current: self
		original: originalSnapshot
		proposed: proposedSnapshot