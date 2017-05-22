testing
testWalkingWithMerge
	| version1 version2 version3 version4 versions |
	"given"
	version1 := self newVersion: '1' withParents: {}.
	version2 := self newVersion: '2' withParents: {version1}.
	version3 := self newVersion: '3' withParents: {version1}.
	version4 := self newVersion: '4' withParents: {version2. version3}.
	"when"
	versions := OrderedCollection new.
	walker
		startingFrom: version4
		do: [:each | versions add: each].
	"then"
	self assert: (versions asBag = {version1. version2. version3. version4} asBag)