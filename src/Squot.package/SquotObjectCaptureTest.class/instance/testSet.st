testing
testSet
	| set shadow |
	set := Set newFrom: {Object new. Object new. Object new}.
	shadow := capturer capture: set.
	self assert: shadow itemSlots size = 3.
	self assert: shadow itemSlots first name ~= shadow itemSlots second name.