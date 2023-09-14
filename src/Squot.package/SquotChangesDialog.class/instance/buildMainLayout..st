toolbuilder
buildMainLayout: builder
	^ SquotGUIUtilities buildVerticalSplit: 0.7
		of: (self buildChangesLayout: builder)
		and: (self buildCommitMessage: builder)
		with: builder