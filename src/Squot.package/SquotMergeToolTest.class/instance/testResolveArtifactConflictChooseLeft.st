tests
testResolveArtifactConflictChooseLeft
	| left right path artifact merge conflictNode |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: (left := SquotArtifactContentMock new).
	left diffBlock: [:otherMock | SquotArtifactContentDiffMock new].
	merge := SquotMerge into: (SquotSnapshot empty)
		merge: (SquotSnapshot builder
					add: (artifact copy content: (right := SquotArtifactContentMock new));
					buildSnapshot)
		basedOn: (SquotSnapshot builder
					add: artifact;
					buildSnapshot).
	self openToolAndTestOn: merge.
	self assert: #('conflicted-artifact (removed/changed)' 'Changed load order') equals: (tool rootNodes collect: [:each | tool nodeLabelOf: each]) asArray.
	(conflictNode := tool rootNodes anyOne) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool deactivateSelectedNode].
	self deny: (self resultIncludesDiffAt: path) "nothing changes in working copy".