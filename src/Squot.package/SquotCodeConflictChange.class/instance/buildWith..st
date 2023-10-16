toolbuilder
buildWith: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildHeader: builder.
		self buildTexts: builder.
		self buildButtons: builder.
	} with: builder