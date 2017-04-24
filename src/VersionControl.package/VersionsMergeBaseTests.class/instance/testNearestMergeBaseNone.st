tests
testNearestMergeBaseNone
	| version1 version2 |
	version1 := self newVersion: '1' withParents: Array empty.
	version2 := self newVersion: '2' withParents: Array empty.
	self assert: (VersionsMergeBase of: version1 and: version2) version isNil.
	self assert: (VersionsMergeBase of: version2 and: version1) version isNil.