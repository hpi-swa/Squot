toolbuilder
buildLayout: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildRemoteList: builder.
		self buildButtons: builder.
	} with: builder