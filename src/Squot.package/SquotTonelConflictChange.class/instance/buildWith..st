toolbuilder
buildWith: builder
	^ builder pluggablePanelSpec new
		layout: #vertical;
		children: {
			self buildHeader: builder.
			self buildText: builder.
			self buildButtons: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself