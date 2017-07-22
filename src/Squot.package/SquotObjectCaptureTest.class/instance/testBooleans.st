testing
testBooleans
	| shadow |
	shadow := capturer captureStandalone: true.
	self assert: shadow value == true.
	shadow := capturer captureStandalone: false.
	self assert: shadow value == false.