sample tests
testThatPasses
	'sequential' displaySequentialProgress:
	[ProgressNotification signal: 0 extra: 'start'.
	#(1) do: [:each |
		'inner sequential' displaySequentialProgress: [ProgressNotification signal: 0.5].
		self assert: true] displayingProgress: 'do progress'.
	ProgressNotification signal: 1 extra: 'end'].