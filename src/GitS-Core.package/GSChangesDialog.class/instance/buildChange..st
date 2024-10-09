toolbuilder
buildChange: builder
	| scrollPane |
	self selectedChange ifNil: [^ self buildNothingSelected: builder].
	scrollPane := builder build: (builder pluggableScrollPaneSpec new
		children: {self selectedChange buildWith: builder};
		name: #children;
		yourself).
	scrollPane scroller layoutPolicy: TableLayout new.
	scrollPane scroller firstSubmorph
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	scrollPane
		color: Color transparent;
		borderWidth: 0.
	^ scrollPane