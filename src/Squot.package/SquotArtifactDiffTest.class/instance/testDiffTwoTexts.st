testing
testDiffTwoTexts
	| diff text1 text2 |
	text1 := 'foo' asText.
	text2 := 'bla' asText.
	diff := text1 asSquotContent squotDiffAgainst: text2 asSquotContent.
	self assert: (diff changedInstVars includesKey: #string).
	self deny: (diff changedInstVars includesKey: #runs).
	