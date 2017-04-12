toolbuilder
buildInputFields: builder
	^ {
	builder pluggableInputFieldSpec new
		model: self;
		getText: #actionUserName;
		editText: #actionUserName:;
		setText: #actionUserName:;
		help: 'Git user name.'.
	builder pluggableInputFieldSpec new
		model: self;
		getText: #actionUserEmail;
		editText: #actionUserEmail:;
		setText: #actionUserEmail:;
		help: 'Git user email'.
	}