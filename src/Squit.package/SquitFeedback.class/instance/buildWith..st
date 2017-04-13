toolbuilder
buildWith: builder
	^ builder build: (builder pluggableDialogSpec new
		model: self;
		label: #labelString;
		extent: 350@250;
		message: 'Please enter a title, a message, and your name (optional):';
		children: (self buildInputFields: builder);
		buttons: (self buildButtons: builder))