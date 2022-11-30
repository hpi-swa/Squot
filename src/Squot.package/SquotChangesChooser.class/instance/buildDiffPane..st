ui toolbuilder
buildDiffPane: builder
	| mainWidgets mainWidgetsPanel |
	mainWidgets := self chooserWidgetSpecs: builder.
	mainWidgetsPanel := builder pluggablePanelSpec new
		children: mainWidgets;
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@1)
			offsets: (0@0 corner: 0@(self buttonHeight negated)));
		wantsResizeHandles: true;
		yourself.
	^ mainWidgetsPanel