toolbuilder
buildLayout: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildMainLayout: builder.
		self buildButtons: builder.
	} with: builder