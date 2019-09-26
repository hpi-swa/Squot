tests
testDictionary
	| restored |
	self captureRestoreAndCompare: (Dictionary newFrom: {1 -> 2. #foo -> #bar. 'bar' -> nil}).
	restored := Dictionary newFrom: {Object new -> Object new}.
	self assert: restored associations size = 1.
	self assert: restored associations first key class == Object.
	self assert: restored associations first value class == Object.