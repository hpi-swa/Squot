tests
captureInValueHolderThenRestoreAndCompare: anObject
	| holder graph restored |
	holder := ValueHolder new contents: anObject; yourself.
	graph := capturer captureGraph: holder.
	restored := materializer rematerializeGraph: graph asShadowGraph.
	self assert: anObject equals: restored contents.
	^ restored