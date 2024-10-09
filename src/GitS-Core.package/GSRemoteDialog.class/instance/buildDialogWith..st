toolbuilder
buildDialogWith: builder
	^ builder pluggableDialogSpec new
		model: self;
		title: self title;
		children: (self buildLayout: builder);
		buttons: (self buildButtons: builder);
		yourself