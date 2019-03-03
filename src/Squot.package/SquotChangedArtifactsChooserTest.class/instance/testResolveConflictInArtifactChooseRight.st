testing
testResolveConflictInArtifactChooseRight
	| left right path artifact patch conflictNode base diffMock choice |
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
				yourself].
	patch := SquotPatch builder
		addDiff: (SquotArtifactDiffWithContentAndBase
					left: artifact
					right: (artifact copy content: (right := SquotArtifactContentMock new))
					base: (artifact copy content: (base := SquotArtifactContentMock new)));
		buildPatch.
	self openToolAndTestOnPatch: patch.
	self assert: tool rootNodes size = 1.
	(conflictNode := tool rootNodes first children first) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool activateSelectedNode].
	self assert: (tool selectedPatch diffAt: path) left = (patch diffAt: path) left;
		assert: (tool selectedPatch diffAt: path) right = (patch diffAt: path) right;
		assert: choice = #right.