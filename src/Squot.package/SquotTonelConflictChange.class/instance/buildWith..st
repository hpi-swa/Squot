toolbuilder
buildWith: builder
	^ builder pluggablePanelSpec new
		layout: #vertical;
		children: {
			{self buildHeader: builder},
			(self buildTexts: builder).
			{self buildButtons: builder}.
		} flatten;
		frame: LayoutFrame fullFrame;
		yourself