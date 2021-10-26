testing
testSymbol
	| symbol shadow |
	symbol := #test.
	shadow := capturer captureStandalone: symbol.
	self assert: shadow value == #test.