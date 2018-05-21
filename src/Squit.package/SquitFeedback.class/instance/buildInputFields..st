toolbuilder
buildInputFields: builder
	^ {
	builder pluggableInputFieldSpec new
		model: self;
		getText: #actionTitle;
		editText: #actionTitle:;
		setText: #actionTitle:;
		help: 'A feedback title...';
		frame: (0@0 corner: 1@0.1).
	builder pluggableTextSpec new
		model: self;
		getText: #actionMessage;
		editText: #actionMessage:;
		setText: #actionMessage:;
		help: 'A message explaining your issue/suggestion in detail...';
		softLineWrap: true;
		frame: (0@0.1 corner: 1@0.9).
	builder pluggableInputFieldSpec new
		model: self;
		getText: #actionAuthor;
		editText: #actionAuthor:;
		setText: #actionAuthor:;
		help: 'Your name (preferably your GitHub user name)...';
		frame: (0@0.9 corner: 1@1).
	}