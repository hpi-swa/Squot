toolbuilder
buildBodyWithoutBase: builder
	^ SquotGUIUtilities buildVerticalSplit: 0.5
		of: (SquotGUIUtilities buildHorizontalSplit: 0.5
				of: (self buildLeftVersionWith: builder)
				and: (self buildRightVersionWith: builder)
				with: builder)
		and: (self buildResolutionPanel: builder)
		with: builder