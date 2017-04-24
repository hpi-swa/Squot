tests
testNearestMergeBaseOneStep
	| version1 version2 versionBase |
	versionBase := self newVersion: 'base' withParents: Array empty.
	version1 := self newVersion: '1' withParents: {versionBase}.
	version2 := self newVersion: '2' withParents: {versionBase}.
	self assert: versionBase == (VersionsMergeBase of: version1 and: version2) version.
	self assert: versionBase == (VersionsMergeBase of: version2 and: version1) version.