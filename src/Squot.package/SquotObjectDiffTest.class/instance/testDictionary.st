testing
testDictionary
	| dict diff |
	dict := Dictionary newFrom: {1 -> 2. 'foo' -> 'bar'. #bla -> (StringHolder new contents: 'blubb'; yourself)}.
	self assertDiffAgainstItselfHasNoChanges: dict.
	diff := self diff: dict againstItselfAfter:
		[dict at: 1 put: 3;
			at: 'fuu' put: (dict at: 'foo');
			removeKey: 'foo'.
		(dict at: #bla) contents: 'blobb'].
	self assert: diff squotHasChanges.
	self flag: 'TODO: assert something about the changes in values and associations'.