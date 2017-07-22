testing
testPoint
	| shadow |
	shadow := capturer captureStandalone: 1@2.
	self assert: shadow slots size = 2.
	self assert: ((Dictionary newFrom: shadow slots) at: 'x') value = 1.
	self assert: ((Dictionary newFrom: shadow slots) at: 'y') value = 2.