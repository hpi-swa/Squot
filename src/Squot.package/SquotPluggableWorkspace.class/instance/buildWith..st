toolbuilder
buildWith: builder
	^ (self buildCodePaneWith: builder)
		frame: LayoutFrame fullFrame;
		yourself