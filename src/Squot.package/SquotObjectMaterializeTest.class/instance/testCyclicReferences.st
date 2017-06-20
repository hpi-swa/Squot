testing
testCyclicReferences
	| subject restored |
	subject := Array new: 1.
	subject at: 1 put: subject.
	restored := self captureAndRestoreWithoutEqualityTest: subject.
	self assert: (restored at: 1) == restored.