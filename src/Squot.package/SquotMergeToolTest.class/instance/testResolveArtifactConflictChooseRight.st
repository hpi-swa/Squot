tests
testResolveArtifactConflictChooseRight
	| base right path artifact merge conflictNode rightArtifact |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: (base := SquotArtifactContentMock new).
	base diffBlock:
		[:other |
		other == right
			ifTrue: [SquotArtifactContentDiffMock new
						onApply: [:diff :target | right];
						yourself]
			ifFalse: [SquotArtifactContentDiffMock new]].
	rightArtifact := artifact copy content: (right := SquotArtifactContentMock new).
	merge := SquotMerge into: SquotSnapshot empty
		merge: (SquotSnapshot builder
					add: rightArtifact;
					buildSnapshot)
		basedOn: (SquotSnapshot builder
					add: artifact;
					buildSnapshot).
	self openToolAndTestOn: merge.
	self assert: #('conflicted-artifact (removed/changed)' 'Changed load order') equals: (tool rootNodes collect: [:each | (tool nodeLabelOf: each) asString]) asArray.
	(conflictNode := tool rootNodes anyOne) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool activateSelectedNode].
	self assert: (tool selectedPatch resolvedPatch diffAt: path) right content = right.