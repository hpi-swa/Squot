toolbuilder
buildCommitSearchPanel: builder
	^ builder pluggablePanelSpec new
		wantsResizeHandles: true;
		model: self;
		children: {self buildCommitList: builder".
				    self buildSearchPanel: builder"};
		frame: (LayoutFrame new leftFraction: 0.2 offset: 0;
					 topFraction: 0 offset: 0;
					 rightFraction: 1 offset: 0;
					 bottomFraction: 0.6 offset: -25)