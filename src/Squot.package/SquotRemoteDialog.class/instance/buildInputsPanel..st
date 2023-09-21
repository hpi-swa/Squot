toolbuilder
buildInputsPanel: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildRemoteNameInput: builder.
		self buildRemoteUrlInput: builder.
	} with: builder