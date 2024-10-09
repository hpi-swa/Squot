toolbuilder
buildInputsPanel: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildRemoteNameInput: builder.
		self buildRemoteUrlInput: builder.
	} with: builder