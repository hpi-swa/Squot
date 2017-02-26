tests
testCached
	[resolver resolve: #home]
		on: FSResolutionRequest
		do: [:req | req resume: self home].
	self
		shouldnt: [self assertOriginResolves: #home]
		raise: FSResolutionRequest