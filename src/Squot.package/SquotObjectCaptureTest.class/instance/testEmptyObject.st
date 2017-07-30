testing
testEmptyObject
	| shadow |
	shadow := capturer captureStandalone: Object new.
	self assert: shadow slots isEmpty.
	capturer nameOf: shadow undecorated ifAbsent: [self fail: 'no name assigned to shadow'].