tests
testRegression1
	"1---------- 4 --- 5 --- 6 --- A --------- B
	      /         \                              /
	    2 --- 3 ------------------------8 --- 9 
	Merge base of A and B is A, but 4 was not sorted out as common ancestor.
	Moreover, to reproduce the failure without the fix, 4 must be placed before A in a Set"
	| version1 version2 version3 version4 version5 version6 version8 version9 versionA versionB |
	version1 := self newVersion: '1' withParents: {}.
	version2 := self newVersion: '2' withParents: {}.
	version3 := self newVersion: '3' withParents: {version2}.
	version4 := self newVersion: 'Bogus merge-base' withParents: {version2. version1}.
	version5 := self newVersion: '5' withParents: {version4}.
	version6 := self newVersion: '6' withParents: {version5}.
	versionA := self newVersion: 'correct merge-base' withParents: {version6}
		number: version4 number.
	version4 number: self nextFakeVersionNumber.
	self assert: version4 hash > versionA hash "commonAncestors Set 'ordering'"
		description: 'precondition to trigger a failure'.
	version8 := self newVersion: 'Merge 3 into x' withParents: {version4. version3}.
	version9 := self newVersion: '9' withParents: {version8}.
	versionB := self newVersion: 'Merge branch x' withParents: {version9. versionA}.
	self assert: versionA == (VersionsMergeBase of: versionA and: versionB) version.
	self assert: versionA == (VersionsMergeBase of: versionB and: versionA) version.