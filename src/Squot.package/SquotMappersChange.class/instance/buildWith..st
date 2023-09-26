as yet unclassified
buildWith: builder
	^ (SquotGUIUtilities buildText: (self diffText) with: builder)
		readOnly: true;
		yourself