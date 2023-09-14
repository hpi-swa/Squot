toolbuilder
buildLayout: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildCommitList: builder.
		self buildButtons: builder.
	} with: builder