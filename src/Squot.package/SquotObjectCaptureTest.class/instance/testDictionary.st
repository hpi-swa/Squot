testing
testDictionary
	| shadow |
	shadow := capturer capture: (Dictionary newFrom: {1 -> 2. #foo -> #bar. 'bar' -> Object new}).