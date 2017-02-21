tests
testNoEntries
	self assert: (GitTree new entries) species = Dictionary.
	self assert: (GitTree new entries) isEmpty