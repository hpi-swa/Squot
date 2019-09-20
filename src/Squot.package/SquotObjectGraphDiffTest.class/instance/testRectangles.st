tests
testRectangles
	"Points should be reassigned, not patched."
	| diff rect origin corner |
	origin := 1@2.
	corner := 3@4.
	rect := (origin corner: corner).
	diff := self diff: rect against: (5@6 corner: 7@8).
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: rect) 	ifAbsent: []) notNil;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: rect origin ifAbsent: []) ifAbsent: []) isNil;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: rect corner ifAbsent: []) ifAbsent: []) isNil.