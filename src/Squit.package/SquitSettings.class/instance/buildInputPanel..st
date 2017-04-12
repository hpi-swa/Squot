toolbuilder
buildInputPanel: builder
	^ builder pluggablePanelSpec new
		model: self;
		layout: #vertical;
		children: (self buildInputFields: builder);
		frame: (0@0 corner: 1@1)