toolbuilder
buildDynamicVersion: aSelector with: builder
	^ builder pluggablePanelSpec new
		model: self;
		children: aSelector;
		yourself