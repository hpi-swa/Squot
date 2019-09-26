tests
captureAndRestore: anObject
	| graph restored |
	graph := capturer captureGraph: anObject.
	restored := materializer rematerializeGraph: graph asShadowGraph.
	^ restored