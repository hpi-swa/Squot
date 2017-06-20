testing
testEmptyObject
	| shadow |
	shadow := capturer capture: Object new.
	self assert: shadow slots isEmpty.