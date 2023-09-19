toolbuilder
buildUpperLayout: builder
	^ SquotGUIUtilities buildHorizontalSplit: 0.2
		of: (self buildProjectsAndRefsPanel: builder)
		and: (self buildCommitList: builder)
		with: builder