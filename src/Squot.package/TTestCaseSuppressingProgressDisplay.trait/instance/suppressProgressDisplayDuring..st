progress suppressing
suppressProgressDisplayDuring: aBlock
	| newExceptionHandling |
	newExceptionHandling := ProgressInitiationException canUnderstand: #resumeSuppressingProgress.
	^ SquotProgressOutput value: SquotNoProgressOutput during: 
		[aBlock
			on: ProgressInitiationException do: [:e |
				e rearmHandlerDuring:
					[newExceptionHandling
						ifTrue: [e resumeSuppressingProgress]
						ifFalse: "Up to Squeak 5.3"
							[[e sendNotificationsTo: [:min :max :current | "silence"]]
								on: ProgressNotification do: [:notification | notification resume]]]]]