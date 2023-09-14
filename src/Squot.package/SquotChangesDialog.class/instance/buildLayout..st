toolbuilder
buildLayout: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildMainLayout: builder.
		self buildButtons: builder.
	} with: builder