tests
testNearestMergeBaseWithUnrelatedMerge
	| version1 version2 version3 version4 version5 versionBase |
	"versionBase --- version2 ---- version3 ---- version5
	                   |                  `---- version4 ----´
	                   `--- version1"
	versionBase := self newVersion: 'base' withParents: Array empty.
	version1 := self newVersion: '1' withParents: {versionBase}.
	version2 := self newVersion: '2' withParents: {versionBase}.
	version3 := self newVersion: '3' withParents: {version2}.
	version4 := self newVersion: '4' withParents: {version2}.
	version5 := self newVersion: '5' withParents: {version3. version4}.
	self assert: versionBase == (VersionsMergeBase of: version5 and: version1) version.
	self assert: versionBase == (VersionsMergeBase of: version1 and: version5) version.