tests
testCaptureAgainProducesEqualGraph
	| object graph1 graph2 |
	object := ValueHolder new contents: 'a string'; yourself.
	graph1 := capturer captureGraph: object.
	graph2 := capturer captureGraph: object.
	self assert: graph1 equals: graph2.