toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: {
		self buildAddButton: builder.
		self buildRemoveButton: builder.
		self buildImportFileButton: builder.
		self buildImportDirectoryButton: builder.
		self buildImportUnmappedFilesButton: builder.
	} with: builder