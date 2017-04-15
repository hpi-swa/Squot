ui toolbuilder
widgetSpecs: builder
	^{builder pluggablePanelSpec new name: 'changes selector';
		name: 'changes selector';
		model: changeChooser;
		children: (changeChooser chooserWidgetSpecs: builder);
		frame: (0@0 corner: 0.4@0.7);
		yourself.
	builder pluggableTextSpec new
		model: self;
		getText: #changeContents; 
		setText: #changeContents:notifying:; 
		selection: #changeContentsSelection; 
		menu: #fieldListMenu:;
		frame: (0.4@0 corner: 1@0.7).
	builder pluggableTextSpec new
		name: 'message for the new version';
		model: self;
		getText: #message;
		setText: #message:;
		frame: (LayoutFrame fractions: (0@0.7 corner: 1@1) offsets: (0@0 corner: 0@(-25)));
		yourself.
	self buildButtonBar: builder}