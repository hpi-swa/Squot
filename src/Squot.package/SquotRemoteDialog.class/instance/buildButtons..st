toolbuilder
buildButtons: builder
	^ {
		self buildCancelButton: builder.
		self buildOkButton: builder.
	}