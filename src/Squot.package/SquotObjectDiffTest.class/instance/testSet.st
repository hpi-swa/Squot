testing
testSet
	| set stringHolder diff |
	set := Set newFrom: {1. 2. stringHolder := StringHolder new contents: 'foo'}.
	self assertDiffAgainstItselfHasNoChanges: set.
	diff := self diff: set againstItselfAfter:
		[set remove: 1;
			add: 3.
		stringHolder contents: 'fooo'].
	self assert: diff squotHasChanges.
	self flag: 'TODO: assert something about the added, removed and changed elements'.