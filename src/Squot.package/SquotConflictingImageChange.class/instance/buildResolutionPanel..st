toolbuilder
buildResolutionPanel: builder
	^ builder pluggablePanelSpec new
		model: self;
		children: #resolutionPanel;
		frame: LayoutFrame fullFrame;
		yourself