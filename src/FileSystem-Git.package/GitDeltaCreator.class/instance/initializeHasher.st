as yet unclassified
initializeHasher
	self hasher: (GitDeltaRabinHasher on: self target).