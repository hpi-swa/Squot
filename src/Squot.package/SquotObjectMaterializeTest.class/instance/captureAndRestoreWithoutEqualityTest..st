testing
captureAndRestoreWithoutEqualityTest: anObject
	| restored graph |
	graph := capturer capture: anObject.
	restored := materializer
		sourceGraph: graph;
		targetGraph: SquotMutableObjectGraph new;
		rematerialize: graph startShadow.
	^ restored