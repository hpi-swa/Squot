*Squot
displaySequentialProgress: aBlock 
	"
	'This takes some time...' displaySequentialProgress: [
		(Delay forMilliseconds: 500) wait.
		ProgressNotification signal: 0.1 extra: 'just starting'.
		(Delay forMilliseconds: 500) wait.
		ProgressNotification signal: 0.5.
		(Delay forMilliseconds: 500) wait.
		ProgressNotification signal: '1.0' extra: 'done'.
		(Delay forMilliseconds: 500) wait.
	]
	"
	ProgressInitiationException
		display: self
		from: 0 to: 1
		during: [:bar | aBlock
				on: ProgressNotification
				do: [:e | 
					bar value: e messageText asNumber.
					e extraParam: self, (e extraParam ifNil: ['']).
					e pass]].
