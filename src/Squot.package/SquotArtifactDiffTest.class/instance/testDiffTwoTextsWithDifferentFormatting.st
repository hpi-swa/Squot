testing
testDiffTwoTextsWithDifferentFormatting
	| diff text1 text2 emphasisDiff |
	text1 := 'foo' asText.
	text2 := 'foo' asText allBold.
	diff := text1 captureWithSquot squotDiffAgainst: text2 captureWithSquot.
	self deny: (diff changedInstVars includesKey: #string).
	self assert: (diff changedInstVars includesKey: #runs).
	self assert:
		((emphasisDiff := (((diff changedInstVars at: #runs)
			changedInstVars at: #values)
			changedVariablePart at: 1)
			changedVariablePart at: 1)
		changedInstVars at: #emphasisCode) left isNil.
	self assert: (emphasisDiff changedInstVars at: #emphasisCode) right = TextEmphasis bold emphasisCode 
