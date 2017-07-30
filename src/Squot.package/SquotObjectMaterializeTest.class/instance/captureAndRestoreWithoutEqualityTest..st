testing
captureAndRestoreWithoutEqualityTest: anObject
	| restored graph |
	graph := capturer captureGraph: anObject.
	restored := materializer
		sourceGraph: graph;
		targetGraph: SquotMutableObjectGraph new;
		rematerialize: graph startShadow.
	^ restored