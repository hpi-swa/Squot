helpers-testing
isEntryRefDelta
	^ self hasRefDeltaSignature and: [
		self verifyRefDeltaDeltification ]