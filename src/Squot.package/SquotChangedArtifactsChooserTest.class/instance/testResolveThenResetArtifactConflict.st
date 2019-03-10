testing
testResolveThenResetArtifactConflict
	| left right path artifact patch conflictNode |
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new path: path; content: (left := SquotArtifactContentMock new).
	left diffBlock: [:otherMock | SquotArtifactContentDiffMock new].
	patch := SquotPatch builder
		addDiff: (SquotArtifactConflict
					leftDiff: (SquotArtifactRemoval of: artifact)
					rightDiff: (SquotArtifactDiffWithContent
						left: artifact
						right: (artifact copy content: (right := SquotArtifactContentMock new))));
		buildPatch.
	self openToolAndTestOnPatch: patch.
	self assert: tool rootNodes size = 1.
	conflictNode := tool rootNodes anyOne.
	conflictNode resetChoice.
	self assert: conflictNode needsChoice.
	conflictNode include.
	tool accept.
	self assert: (tool selectedPatch diffAt: path) = (patch diffAt: path) rightDiff.
	self deny: conflictNode needsChoice.
	conflictNode exclude.
	tool accept.
	self assert: (tool selectedPatch diffAt: path) isRemoval.
	self deny: conflictNode needsChoice.
	conflictNode resetChoice.
	self assert: conflictNode needsChoice.