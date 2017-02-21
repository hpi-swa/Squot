validating
validateMessage
	message ifNotNil: [ ^ self  ].
	
	GitValidationError signal: 'Message is required for validation.'