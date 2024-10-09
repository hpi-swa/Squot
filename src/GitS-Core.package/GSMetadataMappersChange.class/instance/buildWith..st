toolbuilder
buildWith: builder
	^ (GSGUIUtilities buildShrinkWrapText: self diffText with: builder)
		readOnly: true;
		yourself