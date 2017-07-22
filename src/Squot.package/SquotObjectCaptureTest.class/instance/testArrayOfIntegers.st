testing
testArrayOfIntegers
	| shadow |
	shadow := capturer captureStandalone: #(1 2 3).
	self assert: shadow slots size = 3.
	self assert: (shadow slots at: 1) value = 1.
	self assert: (shadow slots at: 2) value = 2.
	self assert: (shadow slots at: 3) value = 3.