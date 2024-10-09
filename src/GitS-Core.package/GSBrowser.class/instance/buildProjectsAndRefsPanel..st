toolbuilder
buildProjectsAndRefsPanel: builder
	^ GSGUIUtilities buildVerticalSplit: 0.5
		of: (self buildProjectList: builder)
		and: (self buildRefTree: builder)
		with: builder