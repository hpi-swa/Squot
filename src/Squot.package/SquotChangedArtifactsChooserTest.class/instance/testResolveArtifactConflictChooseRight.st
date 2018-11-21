testing
testResolveArtifactConflictChooseRight
	| left right path artifact patch conflictNode |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: (left := SquotArtifactContentMock new).
	left diffBlock: [:other | SquotArtifactContentDiffMock new].
	patch := SquotPatch builder
		addDiff: (SquotArtifactConflict
					leftDiff: (SquotArtifactRemoval of: artifact)
					rightDiff: (SquotArtifactDiffWithContent
						left: artifact
						right: (artifact copy content: (right := SquotArtifactContentMock new))));
		buildPatch.
	self openToolAndTestOnPatch: patch.
	self assert: tool rootNodes size = 1.
	(conflictNode := tool rootNodes anyOne) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool activateSelectedNode].
	self deny: (tool selectedPatch diffAt: path) isRemoval.