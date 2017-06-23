testing
testMultipleVisitsToIncludedVersionWithBlock
	| a b c list |
	"given two ways to an included version a"
	a := self newVersion: 'A'
		withParents: {self newVersion: 'pred1' withParents:
			{self newVersion: 'pred2' withParents: #()}}.
	b := self newVersion: 'B' withParents: {a}.
	c := self newVersion: 'C' withParents: {a}.
	"when"
	list := Array streamContents: [:stream |
		walker startingFromAll: {b. c} do: [:each | stream nextPut: each]].
	"then"
	self assert: 1 equals: (list asBag occurrencesOf: a).