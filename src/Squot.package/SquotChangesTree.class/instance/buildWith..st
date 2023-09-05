toolbuilder
buildWith: builder
	| scrollPane |
	scrollPane := builder build: (builder pluggableScrollPaneSpec new
		vScrollBarPolicy: #whenNeeded;
		morph: (builder build:
			(builder pluggablePanelSpec new
				children: (self buildChildren: builder);
				layout: #vertical;
				horizontalResizing: #spaceFill;
				frame: LayoutFrame fullFrame;
				yourself));
		frame: LayoutFrame fullFrame;
		yourself).
	scrollPane scroller changeProportionalLayout.
	scrollPane
		color: Color transparent;
		borderWidth: 0.
	^ BuildInParent child: scrollPane