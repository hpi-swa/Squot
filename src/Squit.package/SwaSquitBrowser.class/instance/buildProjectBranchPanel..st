toolbuilder
buildProjectBranchPanel: builder
	^ builder pluggablePanelSpec new
		wantsResizeHandles: true;
		model: self;
		children: {self buildProjectList: builder.
				self buildCloneButton: builder".    
				self buildBranchList: builder"};
		frame: (LayoutFrame new leftFraction: 0 offset: 0;
					 topFraction: 0 offset: 0;
					 rightFraction: 0.2 offset: 0;
					 bottomFraction: 0.6 offset: -25)