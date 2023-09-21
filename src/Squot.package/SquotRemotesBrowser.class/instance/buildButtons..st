toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildAddRemoteButton: builder.
		self buildEditRemoteButton: builder.
		self buildRemoveRemoteButton: builder.
	} with: builder