testing
testNil
	| shadow |
	shadow := capturer captureStandalone: nil.
	self assert: shadow value == nil.