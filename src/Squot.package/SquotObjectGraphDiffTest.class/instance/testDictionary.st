tests
testDictionary
	| dict diff removedAssociation |
	dict := Dictionary newFrom: {1 -> 2. 'foo' -> 'bar'. #bla -> (StringHolder new contents: 'blubb'; yourself)}.
	removedAssociation := dict associationAt: 'foo'.
	self assertDiffAgainstItselfHasNoChanges: dict.
	diff := self diff: dict againstItselfAfter:
		[dict at: 1 put: 3;
			at: 'fuu' put: (dict at: 'foo');
			removeKey: 'foo'.
		(dict at: #bla) contents: 'blobb'].
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: dict) 	ifAbsent: []) notNil
		description: 'no diff for Dictionary';
		assert: (diff diffForObjectNamed: (objectRegistry nameOf: (dict associationAt: 1)) ifAbsent: []) notNil
		description: 'no diff for changed association'.