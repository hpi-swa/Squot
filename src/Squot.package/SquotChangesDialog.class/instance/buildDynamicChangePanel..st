toolbuilder
buildDynamicChangePanel: builder
	^ builder pluggablePanelSpec new
		model: self;
		children: #buildChange;
		frame: LayoutFrame fullFrame;
		yourself