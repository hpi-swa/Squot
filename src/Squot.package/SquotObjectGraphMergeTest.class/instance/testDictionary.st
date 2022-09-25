tests
testDictionary
	| dict merge removedAssociation |
	dict := Dictionary newFrom: {1 -> 2. 'foo' -> 'bar'. #bla -> (StringHolder new contents: 'blubb'; yourself)}.
	removedAssociation := dict associationAt: 'foo'.
	self deny: (self merge: dict into: dict) hasChanges.
	merge := self mergeOf: dict withChanges:
		[dict at: 1 put: 3;
			at: 'fuu' put: (dict at: 'foo');
			removeKey: 'foo'.
		(dict at: #bla) contents: 'blobb'].
	self assert: merge hasChanges;
		assert: (merge includesMergeAt: (objectRegistry nameOf: dict));
		assert: (merge includesMergeAt: (objectRegistry nameOf: (dict associationAt: 1))).