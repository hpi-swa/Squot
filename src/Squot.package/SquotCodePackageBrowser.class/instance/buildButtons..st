toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildAddPackageButton: builder.
		self buildEditPackagePathButton: builder.
		self buildChangeEncodingButton: builder.
		self buildRemovePackageButton: builder.
	} with: builder