toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildCommitButton: builder.
		self buildFetchAllButton: builder.
		self buildBranchButton: builder.
	} with: builder