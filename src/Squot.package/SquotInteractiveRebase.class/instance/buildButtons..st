toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildChangeOperationButton: builder.
		self buildRunButton: builder.
	} with: builder