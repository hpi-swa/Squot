sample tests
testThatErrs
	'sequential' displaySequentialProgress:
	[ProgressNotification signal: 0 extra: 'start'.
	#(1) do: [:each |
		'inner sequential' displaySequentialProgress: [ProgressNotification signal: 0.5].
		self error: 'I want it that way'] displayingProgress: 'do progress'.
	ProgressNotification signal: 1 extra: 'end'].
