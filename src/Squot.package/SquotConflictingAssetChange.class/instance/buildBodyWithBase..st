toolbuilder
buildBodyWithBase: builder
	^ SquotGUIUtilities buildEvenGrid: {
		self buildBaseVersionWith: builder.
		self buildLeftVersionWith: builder.
		self buildRightVersionWith: builder.
		self buildResolutionPanel: builder.
	} ofSize: 2 @ 2 with: builder