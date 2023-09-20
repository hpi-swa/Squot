toolbuilder
buildWith: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildHead: builder.
		self buildBody: builder.
	} with: builder