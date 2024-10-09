toolbuilder
buildButtons: builder
	^ GSGUIUtilities buildButtons: {
		self buildAddPackageButton: builder.
		self buildEditPackagePathButton: builder.
		self buildChangeEncodingButton: builder.
		self buildRemovePackageButton: builder.
	} with: builder