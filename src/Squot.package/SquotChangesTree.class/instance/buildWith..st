toolbuilder
buildWith: builder
	| scrollPane |
	scrollPane := builder build: (builder pluggableScrollPaneSpec new
		children: (self buildChildren: builder);
		yourself).
	scrollPane scroller layoutPolicy: TableLayout new.
	scrollPane scroller firstSubmorph
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellGap: self childrenGap.
	scrollPane
		color: Color transparent;
		borderWidth: 0.
	^ scrollPane