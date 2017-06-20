testing
testEmptyObject
	| restored |
	restored := self captureAndRestoreWithoutEqualityTest: Object new.
	self assert: restored class == Object.