tests
testResolveThenResetArtifactConflict
	| path base right rightArtifact artifact merge conflictNode |
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
	self openToolAndTestOnPatch: merge.
	self assert: tool rootNodes size = 1.
	conflictNode := tool rootNodes anyOne.
	conflictNode resetChoice.
	self assert: conflictNode needsChoice.
	conflictNode include.
	tool accept.
	self assert: (tool selectedPatch diffAt: path) right content = (merge conflictAt: path) incomingArtifact content.
	self deny: conflictNode needsChoice.
	conflictNode exclude.
	tool accept.
	self deny: (tool selectedPatch includesDiffAt: path) "no changes to working copy".
	self deny: conflictNode needsChoice.
	conflictNode resetChoice.
	self assert: conflictNode needsChoice.