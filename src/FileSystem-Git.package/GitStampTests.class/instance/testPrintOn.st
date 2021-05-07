tests
testPrintOn
	| stamp template now |
	now := TimeStamp now.
	stamp := self defaultStamp atTime: now.
	
	template := 
		GitStamp defaultName, ' <',GitStamp defaultEmail,'> ', 
		now asUnixTime asString, 
		' ',
		(now offset positive ifTrue: ['+'] ifFalse: ['-']),
		(now offset hours printString forceTo: 2 paddingStartWith: $0),
		(now offset minutes printString forceTo: 2 paddingStartWith: $0).
	
	self assert: stamp printString = template