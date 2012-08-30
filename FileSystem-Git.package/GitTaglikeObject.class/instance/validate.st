validating
validate
	"Override in subclasses to provide pre-save validation checks.
	Don't forget to call super validate, though!"
	
	message ifNil: [ GitValidationError signal: 'Message is required for validation.' ].