toolbuilder
buildWith: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildHeader: builder.
		self buildTexts: builder.
		self buildButtons: builder.
	} with: builder