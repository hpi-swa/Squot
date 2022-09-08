tests
testArtifactMergeWithoutConflicts
	| left right base path artifact merge contentMerge mergeNode acceptReturned |
	path := 'common-artifact'.
	artifact := SquotArtifact new path: path; content: (left := SquotArtifactContentMock new).
	left whenMergedReturn: (contentMerge := SquotMergeMock new);
		whenComparedReturnMock.
	contentMerge hasConflicts: false.
	right := SquotArtifactContentMock new.
	base := SquotArtifactContentMock new.
	base whenComparedReturnMock.
	merge := SquotMerge
		into: (SquotSnapshot builder
				add: artifact;
				buildSnapshot)
		merge: (SquotSnapshot builder
					add: (artifact copy content: right);
					buildSnapshot)
		basedOn: (SquotSnapshot builder
					add: (artifact copy content: base);
					buildSnapshot).
	self openToolAndTestOn: merge.
	mergeNode := tool rootNodes detect: [:each | ((tool nodeLabelOf: each) asString includesSubstring: 'common-artifact') and: [(tool nodeLabelOf: each) asString includesSubstring: 'merge']] ifNone: [self fail: 'Merge node not found'].
	self deny: mergeNode anyChildNeedsChoice.
	tool selectNode: mergeNode; deactivateSelectedNode.
	self closeDialogPossiblyOpenedDuring: [tool accept. acceptReturned := true]
		timeoutMsecs: 5.
	self assert: acceptReturned == true.
	self deny: (self resultIncludesDiffAt: path) "nothing changes in working copy".