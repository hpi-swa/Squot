testing
testMultipleVisitsToExcludedVersion
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
	list := walker startingFrom: e.
	"then"
	self assert: (list asArray = {e})