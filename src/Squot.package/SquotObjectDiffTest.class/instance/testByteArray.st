testing
testByteArray
	| left right array other arrayName diff |
	"{1. 2} <=> {1. 2}"
	left := capturer captureStandalone: (array := #[1 2]).
	arrayName := objectRegistry nameOf: array.
	other := #[1 2] copy.
	capturer objectGraph assign: arrayName to: other.
	right := capturer captureStandalone: other.
	diff := left squotDiffAgainst: right.
	self deny: diff squotHasChanges.
	"{2. 1} <=> {1. 2}"
	other := #[2 1].
	capturer objectGraph assign: arrayName to: other.
	left := capturer captureStandalone: other.
	diff := left squotDiffAgainst: right.
	self assert: diff squotHasChanges;
		assert: (diff squotApplyTo: left) = right.