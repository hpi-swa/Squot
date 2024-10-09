toolbuilder
buildButtons: builder
	^ GSGUIUtilities buildButtons: {
		self buildAddOperationButton: builder.
		self buildAbortButton: builder.
		self buildRunButton: builder.
	} with: builder