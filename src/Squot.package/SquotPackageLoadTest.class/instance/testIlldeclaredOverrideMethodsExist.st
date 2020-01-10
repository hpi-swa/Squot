testing
testIlldeclaredOverrideMethodsExist

	self assert: [DateAndTime respondsTo: #fromUnixTime:].