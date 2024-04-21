toolbuilder
buildInputFields: builder
	^ {
	builder pluggableInputFieldSpec new
		model: self;
		getText: #actionTitle;
		setText: #actionTitle:;
		help: 'A feedback title...';
		frame: (LayoutFrame new
			topFraction: 0;
			bottomFraction: 0 offset: self inputFieldHeight;
			leftFraction: 0; rightFraction: 1);
		yourself.
	builder pluggableTextSpec new
		model: self;
		getText: #actionMessage;
		setText: #actionMessage:;
		help: 'A message explaining your issue/suggestion in detail...';
		softLineWrap: true;
		frame: (LayoutFrame new
			topFraction: 0 offset: self inputFieldHeight;
			bottomFraction: 1 offset: self inputFieldHeight negated;
			leftFraction: 0; rightFraction: 1);
		in: [:textSpec |
			(textSpec respondsTo: #plainTextOnly:) ifTrue: ">= Squeak 6.0"
				[textSpec plainTextOnly: true]];
		yourself.
	builder pluggableInputFieldSpec new
		model: self;
		getText: #actionAuthor;
		editText: #actionAuthor:;
		setText: #actionAuthor:;
		help: 'Your name (preferably your GitHub @username)...';
		frame: (LayoutFrame new
			topFraction: 1 offset: self inputFieldHeight negated;
			bottomFraction: 1;
			leftFraction: 0; rightFraction: 1);
		yourself.
	}