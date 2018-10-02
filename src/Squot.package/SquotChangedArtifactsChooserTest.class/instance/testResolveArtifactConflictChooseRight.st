testing
testResolveArtifactConflictChooseRight
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
	tool := self newToolOn: patch.
	self assert: tool rootNodes size = 1.
	self assert: tool rootNodes anyOne anyChildNeedsChoice.
	self resolveArtifactConflict: [:conflictNode | tool activateSelectedNode].
	self deny: (tool selectedPatch diffAt: path) isRemoval.