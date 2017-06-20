testing
testRectangle
	| shadow |
	shadow := capturer capture: (1@2 corner: 3@4).
	self assert: shadow slots size = 2.
	self assert: ((shadow slots at: 'origin') isMemberOf: (capturer capture: 1@2) class).
	self assert: ((shadow slots at: 'origin') slots at: 'x') value = 1.
	self assert: ((shadow slots at: 'origin') slots at: 'y') value = 2.
	self assert: ((shadow slots at: 'corner') isMemberOf: (capturer capture: 3@4) class).
	self assert: ((shadow slots at: 'corner') slots at: 'x') value = 3.
	self assert: ((shadow slots at: 'corner') slots at: 'y') value = 4.