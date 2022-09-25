tests
testSet
	| set stringHolder merge |
	set := Set newFrom: {1. 2. stringHolder := StringHolder new contents: 'foo'}.
	self deny: (self mergeOf: set withChanges: []) hasChanges.
	merge := self mergeOf: set withChanges:
		[set remove: 1;
			add: 3.
		stringHolder contents: 'fooo'].
	self assert: merge hasChanges;
		assert: (merge includesMergeAt: (objectRegistry nameOf: set));
		assert: merge mergeOfStartObject == (merge mergeAt: (objectRegistry nameOf: set));
		assert: (merge includesMergeAt: (objectRegistry nameOf: stringHolder)).