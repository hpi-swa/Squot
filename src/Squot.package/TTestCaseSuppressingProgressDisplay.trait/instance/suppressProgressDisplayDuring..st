progress suppressing
suppressProgressDisplayDuring: aBlock	
	^ SquotProgressOutput value: SquotNoProgressOutput during: 
		[aBlock
			on: ProgressInitiationException do: [:e |
				e isNested
					ifTrue: [e pass]
					ifFalse: [e rearmHandlerDuring:
						[[e sendNotificationsTo: [:min :max :current | "silence"]]
							on: ProgressNotification do: [:notification | notification resume]]]]]