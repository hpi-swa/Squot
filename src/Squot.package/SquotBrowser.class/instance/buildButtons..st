toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildCommitButton: builder.
		self buildPullButton: builder.
		self buildPushButton: builder.
		self buildFetchAllButton: builder.
		self buildBranchButton: builder.
		self buildOtherButton: builder.
	} with: builder