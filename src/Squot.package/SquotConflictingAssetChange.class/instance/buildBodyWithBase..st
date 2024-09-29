toolbuilder
buildBodyWithBase: builder
	^ SquotGUIUtilities buildEvenGrid: {
		self buildDynamicBase: builder.
		self buildDynamicLeft: builder.
		self buildDynamicRight: builder.
		self buildResolutionPanel: builder.
	} ofSize: 2 @ 2 with: builder