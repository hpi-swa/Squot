toolbuilder
buildMessage: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #message;
		setText: #message:;
		editText: #message:;
		help: #messageName;
		plainTextOnly: true;
		indicateUnacceptedChanges: false;
		yourself