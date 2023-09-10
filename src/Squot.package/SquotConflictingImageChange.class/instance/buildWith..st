toolbuilder
buildWith: builder
	^ builder pluggablePanelSpec new
		layout: #vertical;
		children: {
			self buildHead: builder.
			self buildBody: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself