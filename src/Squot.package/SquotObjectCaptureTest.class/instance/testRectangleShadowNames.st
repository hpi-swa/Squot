testing
testRectangleShadowNames
	| shadow |
	shadow := capturer capture: (1@2 corner: 3@4).
	self assert: ((shadow slots at: 'origin') name includes: 'origin').
	self assert: ((shadow slots at: 'corner') name includes: 'corner').