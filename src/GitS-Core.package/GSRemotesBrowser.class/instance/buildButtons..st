toolbuilder
buildButtons: builder
	^ GSGUIUtilities buildButtons: {
		self buildAddRemoteButton: builder.
		self buildEditRemoteButton: builder.
		self buildRemoveRemoteButton: builder.
	} with: builder