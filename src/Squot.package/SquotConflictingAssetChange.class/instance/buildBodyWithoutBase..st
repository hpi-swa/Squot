toolbuilder
buildBodyWithoutBase: builder
	^ SquotGUIUtilities buildVerticalSplit: 0.5
		of: (SquotGUIUtilities buildHorizontalSplit: 0.5
				of: (self buildDynamicLeft: builder)
				and: (self buildDynamicRight: builder)
				with: builder)
		and: (self buildResolutionPanel: builder)
		with: builder