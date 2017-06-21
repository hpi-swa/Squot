testing
testSet
	| set shadow |
	set := Set newFrom: {Object new. Object new. Object new}.
	shadow := capturer capture: set.
	self assert: (shadow slots anyOne) size = 3.
	self assert: (shadow slots anyOne first name ~= shadow slots anyOne second name).