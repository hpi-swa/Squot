toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildAddOperationButton: builder.
		self buildAbortButton: builder.
		self buildRunButton: builder.
	} with: builder