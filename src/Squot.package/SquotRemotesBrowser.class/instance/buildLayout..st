toolbuilder
buildLayout: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildRemoteList: builder.
		self buildButtons: builder.
	} with: builder