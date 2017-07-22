testing
testString
	| string shadow |
	string := 'test'.
	shadow := capturer captureStandalone: string.
	self assert: shadow value = string.
	self deny: shadow value == string.