tests
testNew
	[self assertOriginResolves: #home]
		on: FSResolutionRequest
		do: [:req | req resume: self home].
	