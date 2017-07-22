testing
testSet
	| set shadow |
	set := Set newFrom: {Object new. Object new. Object new}.
	shadow := capturer captureStandalone: set.
	self assert: shadow itemSlots size = 3.
	self assert: shadow itemSlots first value name ~= shadow itemSlots second value name.