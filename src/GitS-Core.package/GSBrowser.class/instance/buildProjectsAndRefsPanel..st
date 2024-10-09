toolbuilder
buildProjectsAndRefsPanel: builder
	^ GSGUIUtilities buildVerticalSplit: 0.5
		of: (self buildProjectList: builder)
		and: (self buildRefList: builder)
		with: builder