tests
testNearestMergeBaseIsNearest2
	| version1 version2 version3 version4 version5 version6 version7 versionBase |
	"versionBase --- version2 ---- (version3)
	                   |                  `---- version4,5 -- version6 -- [version7]
	                   `--- version1 ------------------------´
	There is a long path from versionM to version2, longer than to versionBase,
	but version2 is the correct merge base."
	versionBase := self newVersion: 'base' withParents: Array empty.
	version1 := self newVersion: '1' withParents: {versionBase}.
	version2 := self newVersion: '2' withParents: {versionBase}.
	version3 := self newVersion: '3' withParents: {version2}.
	version4 := self newVersion: '4' withParents: {version2}.
	version5 := self newVersion: '5' withParents: {version4}.
	version6 := self newVersion: '6' withParents: {version5. version1}.
	version7 := self newVersion: '7' withParents: {version6}.
	self assert: version2 == (VersionsMergeBase of: version3 and: version7) version.