toolbuilder
buildMainLayout: builder
	^ SquotGUIUtilities buildVerticalSplit: 0.7
		of: (self buildChangesLayout: builder)
		and: (self buildMessage: builder)
		with: builder