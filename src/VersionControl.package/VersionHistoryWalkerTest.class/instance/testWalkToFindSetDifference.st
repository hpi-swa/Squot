testing
testWalkToFindSetDifference
	| version1 version2 version3 version4 version5 version6 list |
	"version1 --- version2 --- version3 --- version6
	               `--- version4 --- version5 --´"
	version1 := self newVersion: '1' withParents: #().
	version2 := self newVersion: '2' withParents: {version1}.
	version3 := self newVersion: '3' withParents: {version2}.
	version4 := self newVersion: '4' withParents: {version1}.
	version5 := self newVersion: '5' withParents: {version4}.
	version6 := self newVersion: '6' withParents: {version3. version5}.
	"when"
	"rev-list version2...version6 ---> version[3,4,5,6]"
	list := walker
		excludeAncestorsOf: version2;
		startingFromAll: {version2. version6}.
	"then"
	self assert: list asBag = {version3. version4. version5. version6} asBag.
	"TODO: assert something about the order"