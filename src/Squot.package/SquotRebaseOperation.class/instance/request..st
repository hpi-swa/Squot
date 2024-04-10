requesting
request: aString
	^ (UIManager default request: aString)
		ifEmpty: [SquotRebaseCancelChangeOperationError signal]