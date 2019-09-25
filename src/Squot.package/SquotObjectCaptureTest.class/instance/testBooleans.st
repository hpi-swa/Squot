testing
testBooleans
	| shadow |
	shadow := capturer captureStandalone: (ValueHolder new contents: true).
	self assert: (shadow slots at: 'contents') value == true.
	shadow := capturer captureStandalone: (ValueHolder new contents: false).
	self assert: (shadow slots at: 'contents') value == false.