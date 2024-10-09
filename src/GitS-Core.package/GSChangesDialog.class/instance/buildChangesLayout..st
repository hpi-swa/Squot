toolbuilder
buildChangesLayout: builder
	^ GSGUIUtilities buildHorizontalSplit: 0.3
		of: (self buildChangesTree: builder)
		and: (self buildDynamicChangePanel: builder)
		with: builder