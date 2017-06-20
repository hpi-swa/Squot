testing
testBooleans
	| shadow |
	shadow := capturer capture: true.
	self assert: shadow value == true.
	shadow := capturer capture: false.
	self assert: shadow value == false.