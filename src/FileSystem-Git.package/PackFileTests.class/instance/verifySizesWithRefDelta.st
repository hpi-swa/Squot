helpers-verifying
verifySizesWithRefDelta
	self 
		assert: 214 
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 12)).
	self
		assert: 214
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 161)).
	self
		assert: 165
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 310)).
	self
		assert: 33
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 429)).
	self
		assert: 28977
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 473)).
	self
		assert: 33
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 705)).
	self
		assert: 15
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 749)).
	self
		assert: 33
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 794)).
	self
		assert: 8
		equals: (self getSizeFromHeaders: (self getEntryHeadersAt: 838))