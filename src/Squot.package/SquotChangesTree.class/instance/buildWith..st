toolbuilder
buildWith: builder
	^ (SquotGUIUtilities
		buildVerticalLayout: (self buildChildren: builder)
		with: builder)
			spacing: self childrenGap;
			yourself