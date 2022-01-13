toolbuilder
buildWith: builder
	^ builder build: (builder pluggableDialogSpec new
		model: self;
		label: #labelString;
		extent: 350@250 * RealEstateAgent scaleFactor;
		message: 'This will open an issue on GitHub for you.
Please enter a title, a message, and your @username.
You can post under another name or anonymously, 
but often we need a way to contact you for further questions.';
		children: (self buildInputFields: builder);
		buttons: (self buildButtons: builder))