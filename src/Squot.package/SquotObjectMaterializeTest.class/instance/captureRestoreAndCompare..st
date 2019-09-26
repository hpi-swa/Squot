tests
captureRestoreAndCompare: anObject
	| graph restored |
	graph := capturer captureGraph: anObject.
	restored := materializer rematerializeGraph: graph asShadowGraph.
	self assert: anObject equals: restored.
	^ restored