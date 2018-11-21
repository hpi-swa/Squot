toolbuilder
buildWith: builder
	^ builder build: (builder pluggableDialogSpec new
		model: self;
		label: 'Add Git remote';
		message: 'Enter parameters of the new remote:';
		children: {self buildInputPanel: builder};
		buttons: (self buildButtons: builder);
		closeAction: #onClose;
		exclusive: false;
		extent: 475@60)