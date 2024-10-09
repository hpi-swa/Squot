toolbuilder
buildWith: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildHead: builder.
		self buildBody: builder.
	} with: builder