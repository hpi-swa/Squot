tests
testProposesOrigin
	"when"
	operation initializeQuery.
	"then"
	self assert: 'origin' equals: operation query remoteName.