testing
testResolveConflictInArtifactChooseRight
	| left right path artifact originalPatch conflictNode base diffMock choice selectedPatch patchedContent |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: (left := SquotArtifactContentMock new).
	left diffBlock: [:rightMock :baseMock |
			diffMock := SquotArtifactContentDiffMock new
				topNodes: (Array with: (SquotMergeDiffNode
											title: 'conflict'
											content: nil
											children: #()
											onInclude: [choice := #right]
											onExclude: [choice := #left]
											onReset: [choice := nil]));
				onApply: [:diff :target | patchedContent := SquotArtifactContentMock new]
				yourself].
	originalPatch := SquotPatch builder
		addDiff: (SquotArtifactDiffWithContentAndBase
					left: artifact
					right: (artifact copy content: (right := SquotArtifactContentMock new))
					base: (artifact copy content: (base := SquotArtifactContentMock new)));
		buildPatch.
	self openToolAndTestOnPatch: originalPatch.
	self assert: tool rootNodes size = 1.
	(conflictNode := tool rootNodes first children first) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool activateSelectedNode].
	self assert: choice = #right;
		assert: ((selectedPatch := tool selectedPatch) diffAt: path) left
					= (originalPatch diffAt: path) left
		description: 'left of edited artifact should be unmodified';
		assert: (selectedPatch diffAt: path) right content = patchedContent
		description: 'right of edited artifact should be patched'.