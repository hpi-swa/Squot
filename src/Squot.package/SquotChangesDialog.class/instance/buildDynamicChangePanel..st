toolbuilder
buildDynamicChangePanel: builder
	^ builder pluggablePanelSpec new
		model: self;
		children: #buildChange;
		yourself