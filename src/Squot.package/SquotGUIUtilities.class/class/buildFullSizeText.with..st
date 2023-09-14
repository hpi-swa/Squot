toolbuilder
buildFullSizeText: aText with: builder
	^ (self buildText: aText with: builder)
		frame: LayoutFrame fullFrame;
		yourself