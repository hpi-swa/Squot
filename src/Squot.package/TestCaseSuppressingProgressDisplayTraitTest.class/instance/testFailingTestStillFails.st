as yet unclassified
testFailingTestStillFails
	testCase := self subjectTestCase selector: #testThatFails.
	result := testCase run.
	self assert: (result failures includes: testCase).