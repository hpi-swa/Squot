testing
testString
	| string shadow |
	string := 'test'.
	shadow := capturer capture: string.
	self assert: shadow value = string.
	self deny: shadow value == string.