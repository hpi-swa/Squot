as yet unclassified
testPassingTestStillPasses
	testCase := self subjectTestCase selector: #testThatPasses.
	result := testCase run.
	self assert: (result passed includes: testCase).