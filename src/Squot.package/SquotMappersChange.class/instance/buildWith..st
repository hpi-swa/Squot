toolbuilder
buildWith: builder
	^ (SquotGUIUtilities buildShrinkWrapText: (self diffText) with: builder)
		readOnly: true;
		yourself