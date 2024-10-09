toolbuilder
buildLayout: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildMainLayout: builder.
		self buildAutoSaveNote: builder.
		self buildButtons: builder.
	} with: builder