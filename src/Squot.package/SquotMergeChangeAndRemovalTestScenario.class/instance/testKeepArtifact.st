tests
testKeepArtifact
	self repository withUnitOfWork:
		["when"
		self mergeButKeepArtifact.
		"then"
		self assert: (self workingCopy includesObjectAt: 'text');
			assert: self expectedObjectOrderAfterMerge
			equals: (self workingCopy loadOrder asArray intersection: #('first other' 'text' 'second other'))].