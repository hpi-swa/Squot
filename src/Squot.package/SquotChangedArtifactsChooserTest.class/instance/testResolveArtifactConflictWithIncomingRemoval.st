testing
testResolveArtifactConflictWithIncomingRemoval
	| left right path artifact patch conflictNode |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: (left := SquotArtifactContentMock new).
	left diffBlock: [:otherMock | SquotArtifactContentDiffMock new].
	patch := SquotPatch builder
		addDiff: (SquotArtifactConflict
					leftDiff: (SquotArtifactDiffWithContent
						left: artifact
						right: (artifact copy content: (right := SquotArtifactContentMock new)))
					rightDiff: (SquotArtifactRemoval of: artifact));
		buildPatch.
	self openToolAndTestOnPatch: patch.
	self assert: tool rootNodes size = 1.
	(conflictNode := tool rootNodes anyOne) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool activateSelectedNode].
	self assert: (tool selectedPatch diffAt: path) isRemoval.