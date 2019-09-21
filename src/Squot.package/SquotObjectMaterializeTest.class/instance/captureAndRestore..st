testing
captureAndRestore: anObject
	| graph restored |
	graph := capturer captureGraph: anObject.
	restored := materializer rematerializeGraph: graph.
	self assert: anObject equals: restored.
	^ restored