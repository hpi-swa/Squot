helpers
shouldNotBeATypeError: anExceptionalEvent
	self deny: (anExceptionalEvent isMemberOf: MessageNotUnderstood)
		description: 'the error should not be a type error'.
	