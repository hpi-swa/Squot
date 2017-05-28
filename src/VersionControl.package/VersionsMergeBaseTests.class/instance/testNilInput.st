tests
testNilInput
	| version1 |
	version1 := self newVersion: 'base' withParents: Array empty.
	self assert: (VersionsMergeBase of: nil and: version1) version isNil.
	self assert: (VersionsMergeBase of: version1 and: nil) version isNil.