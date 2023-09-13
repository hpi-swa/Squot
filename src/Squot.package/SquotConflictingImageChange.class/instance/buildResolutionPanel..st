toolbuilder
buildResolutionPanel: builder
	^ builder pluggablePanelSpec new
		layout: #vertical;
		children: {
			self buildText: 'Resolution:' with: builder.
			self buildDynamicVersion: #buildResolution with: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself.