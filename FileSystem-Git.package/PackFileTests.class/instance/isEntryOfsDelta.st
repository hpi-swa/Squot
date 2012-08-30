helpers-testing
isEntryOfsDelta
	^ self hasOfsDeltaSignature and: [
		self verifyOfsDeltaDeltification ]