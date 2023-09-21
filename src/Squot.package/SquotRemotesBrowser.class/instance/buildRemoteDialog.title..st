toolbuilder
buildRemoteDialog: builder title: aString
	^ builder pluggableDialogSpec new
		title: aString;
		children: {self buildInputsPanel: builder};
		button: {self buildDialogOkButton: builder};
		yourself