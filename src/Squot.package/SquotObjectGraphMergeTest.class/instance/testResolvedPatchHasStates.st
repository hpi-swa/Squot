tests
testResolvedPatchHasStates
	| baseGraph baseObject capturer incomingGraph incomingObject merge objectRegistry patch workingGraph workingObject |
	baseObject := ValueHolder new contents: 1.
	workingObject := ValueHolder new contents: 2.
	incomingObject := ValueHolder new contents: 3.
	objectRegistry := SquotObjectRegistry new.
	(capturer := SquotObjectCapturer new) registry: objectRegistry.
	baseGraph := capturer captureGraph: baseObject.
	objectRegistry
		assign: (objectRegistry nameOf: baseObject) to: workingObject;
		assign: (objectRegistry nameOf: baseObject) to: incomingObject.
	workingGraph := capturer captureGraph: workingObject.
	incomingGraph := capturer captureGraph: incomingObject.
	merge := SquotObjectGraphMerge into: workingGraph merge: incomingGraph basedOn: baseGraph.
	self assert: merge base == baseGraph;
		assert: merge working == workingGraph;
		assert: merge incoming == incomingGraph.
	((merge mergeAt: (objectRegistry nameOf: baseObject)) conflictAt: 'contents') chooseIncoming.
	patch := merge resolvedPatch.
	self assert: patch left == workingGraph;
		assert: patch right = incomingGraph.