tests
testCyclicReferences
	| subject restored |
	subject := Array new: 1.
	subject at: 1 put: subject.
	restored := self captureAndRestore: subject.
	self assert: (restored at: 1) == restored.
	self assert: (capturer objectGraph nameOf: subject)
		equals: (materializer objectGraph nameOf: restored).