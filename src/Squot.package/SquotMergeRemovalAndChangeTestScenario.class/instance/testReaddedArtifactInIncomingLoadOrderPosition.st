tests
testReaddedArtifactInIncomingLoadOrderPosition
	self repository withUnitOfWork:
		["when"
		self mergeAndReaddObject.
		"then"
		self assert: (self workingCopy includesObjectAt: 'text');
			assert: self expectedObjectOrderAfterReadding
			equals: (self workingCopy loadOrder asArray intersection: #('first other' 'text' 'second other'))].