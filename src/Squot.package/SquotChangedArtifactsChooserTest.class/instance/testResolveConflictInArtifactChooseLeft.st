testing
testResolveConflictInArtifactChooseLeft
	| left right path artifact originalPatch base diffMock conflictNode choice patchedContent selectedPatch |
	"given an artifact that has conflicts in its contents"
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
				hasConflicts: true;
				onApply: [:diff :target | patchedContent := SquotArtifactContentMock new];
				yourself].
	originalPatch := SquotPatch builder
		addDiff: (SquotArtifactDiffWithContentAndBase
					left: artifact
					right: (artifact copy content: (right := SquotArtifactContentMock new))
					base: (artifact copy content: (base := SquotArtifactContentMock new)));
		buildPatch.
	self openToolAndTestOnPatch: originalPatch.
	self assert: tool rootNodes size = 1.
	"when the content's node is excluded, so the incoming changes should be discarded"
	(conflictNode := tool rootNodes first children first) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool deactivateSelectedNode].
	"then there should be nothing to be patched"
	self assert: choice = #left description: 'exclude block evaluated';
		assert: ((selectedPatch := tool selectedPatch) diffAt: path) left
					= (originalPatch diffAt: path) left
		description: 'left of edited artifact should be unmodified';
		assert: (((selectedPatch := tool selectedPatch) includesDiffAt: path) not
					or: [(selectedPatch diffAt: path) right content = patchedContent])
		description: 'right of edited artifact should be patched'.