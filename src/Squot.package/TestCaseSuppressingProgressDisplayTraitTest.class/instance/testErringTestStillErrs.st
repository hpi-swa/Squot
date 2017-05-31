as yet unclassified
testErringTestStillErrs
	testCase := self subjectTestCase selector: #testThatErrs.
	result := testCase run.
	self assert: (result errors includes: testCase).