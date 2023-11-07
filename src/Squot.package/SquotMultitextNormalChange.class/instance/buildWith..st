toolbuilder
buildWith: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildTexts: builder.
		self isEditable ifTrue: [self buildEditButton: builder].
	} with: builder