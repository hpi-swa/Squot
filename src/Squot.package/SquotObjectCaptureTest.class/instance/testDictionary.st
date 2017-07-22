testing
testDictionary
	| shadow |
	shadow := capturer captureStandalone: (Dictionary newFrom: {1 -> 2. #foo -> #bar. 'bar' -> Object new}).