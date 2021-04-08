testing
testCompiledMethod
	| testMethod shadow |
	testMethod := self class >> self selector.
	shadow := capturer captureStandalone: testMethod.
	self assert: (shadow instVarSlotNamed: #header) value normalize = testMethod header.
	self assert: (shadow instVarSlotNamed: #literals) size = testMethod literals size.
	self assert: shadow basicSizeOfMaterializedInstance = testMethod size.