as yet unclassified
testProgressIsMuted
	testCase := self subjectTestCase selector: #testThatPasses.
	result := [testCase run] on: ProgressInitiationException do: [:e | self fail: 'Progress not muted'].