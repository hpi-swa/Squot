toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildCommitButton: builder.
		self buildBranchButton: builder.
	} with: builder