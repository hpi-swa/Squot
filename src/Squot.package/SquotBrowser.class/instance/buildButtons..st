toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildCommitButton: builder.
		self buildPushButton: builder.
		self buildFetchAllButton: builder.
		self buildBranchButton: builder.
	} with: builder