toolbuilder
buildCommitMessage: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #commitMessage;
		setText: #commitMessage:;
		editText: #commitMessage:;
		plainTextOnly: true;
		indicateUnacceptedChanges: false;
		frame: LayoutFrame fullFrame;
		yourself