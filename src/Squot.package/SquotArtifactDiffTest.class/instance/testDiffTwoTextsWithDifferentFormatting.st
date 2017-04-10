testing
testDiffTwoTextsWithDifferentFormatting
	| diff text1 text2 |
	text1 := 'foo' asText.
	text2 := 'foo' asText allBold.
	diff := text1 asSquotContent squotDiffAgainst: text2 asSquotContent.
	self deny: (diff changedInstVars includesKey: #string).
	self assert: (diff changedInstVars includesKey: #runs).
	self assert:
		((((diff changedInstVars at: #runs)
		changedInstVars at: #values)
		changedVariablePart at: 1)
		changedVariablePart at: 1) left isNil.
