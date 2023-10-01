toolbuilder
buildLayout: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildMainLayout: builder.
		self buildAutoSaveNote: builder.
		self buildButtons: builder.
	} with: builder