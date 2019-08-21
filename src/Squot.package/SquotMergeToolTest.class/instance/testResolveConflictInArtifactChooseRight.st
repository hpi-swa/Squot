tests
testResolveConflictInArtifactChooseRight
	| left right path artifact merge conflictNode base incomingDiffMock mergeMock workingDiffMock |
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
			working: left;
			incoming: right;
			base: base;
			diffTreeNodes: (Array with:
				(SquotMergeDiffNode
					title: 'conflict'
					content: nil
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
	"when the content's node is inclued to load the incoming changes"
	(conflictNode := tool rootNodes first children first) resetChoice.
	self assert: conflictNode anyChildNeedsChoice.
	self resolveArtifactConflict: [:aNode | tool activateSelectedNode].
	"then the resulting patch should include the modifications"
	self assert: mergeMock choice = #incoming description: 'include block evaluated';
		assert: (tool selectedPatch mergeAt: path) working = artifact
		description: 'working artifact should be unmodified';
		assert: (self resultDiffAt: path) right content = right
		description: 'modification should be included'.