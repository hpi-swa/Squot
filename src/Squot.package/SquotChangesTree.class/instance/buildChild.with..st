toolbuilder
buildChild: aChange with: builder
	^ builder pluggablePanelSpec new
		horizontalResizing: #spaceFill;
		minimumHeight: (self minimumChildHeight: builder);
		children: {(aChange buildWith: builder)
					frame: LayoutFrame fullFrame;
					yourself};
		yourself