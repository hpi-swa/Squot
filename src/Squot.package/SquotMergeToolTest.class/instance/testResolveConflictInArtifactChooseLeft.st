tests
testResolveConflictInArtifactChooseLeft
	| left right path artifact merge base mergeMock conflictNode incomingDiffMock workingDiffMock |
	"given an artifact that has conflicts in its contents"
	path := 'conflicted-artifact'.
	artifact := SquotArtifact new
		path: path;
		content: (left := SquotArtifactContentMock new id: 'left').
	right := SquotArtifactContentMock new id: 'right'.
	base := SquotArtifactContentMock new id: 'base'.
	workingDiffMock := SquotArtifactContentDiffMock new
		id: 'working';
		whenAppliedTo: base return: [left].
	incomingDiffMock := SquotArtifactContentDiffMock new
		id: 'incoming';
		whenAppliedTo: base return: [right].
	base whenComparedWith: left return: [workingDiffMock].
	base whenComparedWith: right return: [incomingDiffMock].
	left whenMergedReturn:
		((mergeMock := SquotMergeMock new)
			diffTreeNodes: (Array with:
				(SquotMergeDiffNode
					title: 'conflict'
					content: mergeMock
					children: #()
					onInclude: [mergeMock chooseIncoming]
					onExclude: [mergeMock chooseWorking]
					onReset: [mergeMock resetChoice]));
			yourself).
	merge := SquotMerge
		into: (SquotSnapshot builder add: artifact; buildSnapshot)
		merge: (SquotSnapshot builder
			add: (artifact copy content: right);
			buildSnapshot)
		basedOn: (SquotSnapshot builder
			add: (artifact copy content: base);
			buildSnapshot).
	self openToolAndTestOn: merge.
	self assert: tool rootNodes size = 1.
	"when the content's node is excluded to discard the incoming changes"
	(conflictNode := tool rootNodes first children first) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool deactivateSelectedNode].
	"then there should be nothing to be patched"
	self assert: mergeMock choice = #working description: 'exclude block evaluated';
		assert: (tool selectedPatch mergeAt: path) working = artifact
		description: 'working artifact should be unmodified';
		deny: (tool selectedPatch includesModificationAt: path)
		description: 'no modification should be left'.