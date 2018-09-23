testing
testResolveArtifactConflictChooseLeft
	| path artifact patch |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	patch := SquotPatch builder
		addDiff: (SquotArtifactConflict
					leftDiff: (SquotArtifactRemoval of: artifact)
					rightDiff: (SquotArtifactDiff
						left: artifact
						right: (artifact copy content: SquotArtifactContentMock new)));
		buildPatch.
	selectionTool := SquotChangedArtifactsChooser on: patch.
	self assert: selectionTool rootNodes size = 1.
	self assert: selectionTool rootNodes anyOne anyChildNeedsChoice.
	self resolveArtifactConflict: [:conflictNode | selectionTool deactivateSelectedNode].
	self assert: (selectionTool selectedPatch diffAt: path) isRemoval.