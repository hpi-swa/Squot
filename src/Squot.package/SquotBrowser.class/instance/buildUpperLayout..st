toolbuilder
buildUpperLayout: builder
	^ SquotGUIUtilities buildHorizontalSplit: 0.2
		of: (self buildRefList: builder)
		and: (self buildCommitList: builder)
		with: builder