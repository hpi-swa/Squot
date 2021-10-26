tests
testByteArray
	| left right array arrayName other diff |
	"{1. 2} <=> {1. 2}"
	array := #[1 2].
	other := #[1 2] copy.
	left := capturer captureGraph: (ValueHolder new contents: array; yourself).
	arrayName := objectRegistry nameOf: array.
	objectRegistry assign: arrayName to: other.
	diff := left squotDiffAgainst: (capturer captureGraph: (ValueHolder new contents: other; yourself)).
	self assert: (diff diffForObjectNamed: arrayName ifAbsent: []) isNil.
	"{2. 1} <=> {1. 2}"
	other := #[2 1].
	capturer objectGraph assign: (objectRegistry nameOf: array) to: other.
	diff := left squotDiffAgainst: (right := capturer captureGraph: (ValueHolder new contents: other; yourself)).
	self assert: (diff := diff diffForObjectNamed: arrayName ifAbsent: []) notNil;
		assert: (diff squotApplyTo: (left shadowNamed: arrayName)) = (right shadowNamed: arrayName).