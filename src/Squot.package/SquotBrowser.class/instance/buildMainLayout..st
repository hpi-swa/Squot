toolbuilder
buildMainLayout: builder
	^ SquotGUIUtilities buildVerticalSplit: 0.6
		of: (self buildUpperLayout: builder)
		and: (self buildLowerLayout: builder)
		with: builder