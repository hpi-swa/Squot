testing
testResolveArtifactConflictChooseRight
	| path artifact diffs patch |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	diffs := Dictionary new
		add: path -> (SquotArtifactConflict
			leftDiff: (SquotArtifactRemoval of: artifact)
			rightDiff: (SquotArtifactDiff
				left: artifact
				right: (artifact copy content: SquotArtifactContentMock new)));
		yourself.
	patch := SquotPatch with: diffs.
	selectionTool := SquotChangedArtifactsChooser on: patch.
	self assert: selectionTool rootNodes size = 1.
	self assert: selectionTool rootNodes anyOne anyChildNeedsChoice.
	self resolveArtifactConflict: [:conflictNode | selectionTool activateSelectedNode].
	self deny: (selectionTool selectedPatch diffAt: path) isRemoval.