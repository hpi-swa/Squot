tests
testArrayOfIntegers
	| left right other arrayName diff |
	"{1. 2} <=> {1. 2}"
	left := capturer captureGraph: {1. 2}.
	arrayName := left startName.
	other := Array with: 1 with: 2.
	capturer objectGraph assign: arrayName to: other.
	right := capturer captureGraph: other.
	diff := left squotDiffAgainst: right.
	self deny: diff squotHasChanges.
	"{2. 1} <=> {1. 2}"
	other := Array with: 2 with: 1.
	capturer objectGraph assign: arrayName to: other.
	left := capturer captureGraph: other.
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: arrayName ifAbsent: []) notNil.
	"{1} <=> {1. 2}"
	other := Array with: 1.
	capturer objectGraph assign: arrayName to: other.
	left := capturer captureGraph: other.
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: arrayName ifAbsent: []) notNil.
	"{1. 2} <=> {1}"
	diff := right squotDiffAgainst: left.
	self assert: diff squotHasChanges;
		assert: (diff diffForObjectNamed: arrayName ifAbsent: []) notNil.