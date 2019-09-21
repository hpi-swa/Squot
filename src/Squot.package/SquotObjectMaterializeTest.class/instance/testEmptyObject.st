tests
testEmptyObject
	| restored |
	restored := self captureAndRestore: Object new.
	self assert: restored class == Object.