toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildAddButton: builder.
		self buildRemoveButton: builder.
	} with: builder