testing
testNil
	| shadow |
	shadow := capturer capture: nil.
	self assert: shadow value == nil.