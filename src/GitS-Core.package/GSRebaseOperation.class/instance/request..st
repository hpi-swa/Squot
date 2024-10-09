requesting
request: aString
	^ (UIManager default request: aString)
		ifEmpty: [GSRebaseCancelChangeOperationError signal]