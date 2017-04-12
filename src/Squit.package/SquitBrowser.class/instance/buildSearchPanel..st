toolbuilder
buildSearchPanel: builder
	^ builder pluggablePanelSpec new
		model: self;
		children: {self buildSearchBar: builder.
				    self buildSearchClearButton: builder};
		frame: (LayoutFrame new leftFraction: 0 offset: 0;
					 topFraction: 0.96 offset: -15;
					 rightFraction: 1 offset: 0;
					 bottomFraction: 1 offset: 0)