testing
testEmptyObject
	| shadow |
	shadow := capturer captureStandalone: Object new.
	self assert: shadow slots isEmpty.
	self assert: shadow hasSquotShadowName.