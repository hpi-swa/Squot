as yet unclassified
debugTest
	"self debugTest"
	| tests testCase |
	tests := self buildSuiteFromSelectors tests.
	testCase := UIManager default chooseFrom: (tests collect: #selector) values: tests.
	^ testCase ifNotNil: #debugAsFailure