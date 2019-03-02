ui toolbuilder
buildDiffPane: builder
	| mainWidgetsPanel |
	mainWidgetsPanel := super buildDiffPane: builder.
	mainWidgetsPanel 
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@0.7)
			offsets: (0@0 corner: 0@0));
		wantsResizeHandles: true.
	^ mainWidgetsPanel