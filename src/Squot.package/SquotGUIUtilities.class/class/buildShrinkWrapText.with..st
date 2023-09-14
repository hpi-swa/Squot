toolbuilder
buildShrinkWrapText: aText with: builder
	^ (self buildText: aText with: builder)
		verticalResizing: #shrinkWrap;
		yourself