testing
testMultipleVisitsToExcludedVersionWithBlock
	| a b c d e list |
	"given a long way from excluded version d to common ancestor a
	and a short way from start version e to a"
	a := self newVersion: 'A' withParents: #().
	b := self newVersion: 'B' withParents: {a}.
	c := self newVersion: 'C' withParents: {b}.
	d := self newVersion: 'D' withParents: {c}.
	e := self newVersion: 'E' withParents: {a}.
	"when"
	walker excludeAncestorsOf: d.
	list := Array streamContents: [:stream |
		walker startingFrom: e do: [:each | stream nextPut: each]].
	"then"
	self assert: (list = {e}).