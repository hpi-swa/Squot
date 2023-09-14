toolbuilder
buildChangesLayout: builder
	^ SquotGUIUtilities buildHorizontalSplit: 0.3
		of: (self buildChangesTree: builder)
		and: (self buildDynamicChangePanel: builder)
		with: builder