tests
testNearestMergeBaseFar
	| version1 version2 version3 version4 versionBase |
	"versionBase --- version1 --- version2 --- version3
	                    `--- version4 --- version5 --- version6"
	versionBase := self newVersion: 'base' withParents: Array empty.
	version1 := self newVersion: '1' withParents: {versionBase}.
	version2 := self newVersion: '2' withParents: {versionBase}.
	version3 := self newVersion: '3' withParents: {version2}.
	version4 := self newVersion: '4' withParents: {version2}.
	self assert: version2 == (VersionsMergeBase of: version3 and: version4) version.
	self assert: version2 == (VersionsMergeBase of: version3 and: version4) version.