toolbuilder
buildWith: builder
	^ GSGUIUtilities buildVerticalLayout: {
		self buildTexts: builder.
		self isEditable ifTrue: [self buildEditButton: builder].
	} with: builder