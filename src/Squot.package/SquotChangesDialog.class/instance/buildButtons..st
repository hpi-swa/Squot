toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildCancelButton: builder.
		self buildCommitButton: builder.
	} with: builder