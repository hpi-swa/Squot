tests
testRectangles
	"Points should be reassigned, not patched."
	| merge rect origin corner |
	origin := 1@2.
	corner := 3@4.
	rect := (origin corner: corner).
	merge := self merge: (5@6 corner: 7@8) into: rect.
	self assert: merge hasChanges;
		assert: (merge includesMergeAt: (objectRegistry nameOf: rect));
		deny: (merge includesModificationAt: (objectRegistry nameOf: rect origin ifAbsent: []));
		deny: (merge includesModificationAt: (objectRegistry nameOf: rect corner ifAbsent: [])).