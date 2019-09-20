tests
testSet
	| set stringHolder diff |
	set := Set newFrom: {1. 2. stringHolder := StringHolder new contents: 'foo'}.
	self assertDiffAgainstItselfHasNoChanges: set.
	diff := self diff: set againstItselfAfter:
		[set remove: 1;
			add: 3.
		stringHolder contents: 'fooo'].
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: set) ifAbsent: []) notNil;
		assert: diff startDiff == (diff diffForObjectNamed: (objectRegistry nameOf: set));
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: stringHolder) ifAbsent: []) notNil
		description: 'no diff for changed item'.