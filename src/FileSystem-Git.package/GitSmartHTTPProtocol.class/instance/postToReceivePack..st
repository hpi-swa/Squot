private
postToReceivePack: aByteArray
	| attemptsLeft |
	attemptsLeft := PushRepeatCount.
	[^ self client httpPost: (self urlForService: 'git-receive-pack')
		content: aByteArray type: 'application/x-git-receive-pack-request']
	on: ConnectionClosed
	do: [:e | attemptsLeft := attemptsLeft - 1.
		attemptsLeft > 0
			ifTrue: [(Delay forMilliseconds: 500) wait.
				e retry]
			ifFalse: [e pass]].