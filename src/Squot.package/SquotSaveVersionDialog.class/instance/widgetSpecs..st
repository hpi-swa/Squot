ui toolbuilder
widgetSpecs: builder
	^{builder pluggablePanelSpec new
		name: 'changes selector';
		model: changeChooser;
		children: (changeChooser chooserWidgetSpecs: builder);
		frame: (0@0 corner: 0.5@1);
		yourself.
	builder pluggableTextSpec new
		name: 'message for the new version';
		model: self;
		getText: #message;
		setText: #message:;
		frame: (LayoutFrame fractions: (0.5@0 corner: 1@1) offsets: (0@0 corner: 0@ self buttonHeight negated));
		yourself.
	builder pluggableButtonSpec new
		model: self;
		label: 'accept';
		action: #accept;
		frame: (LayoutFrame fractions: (0.5@1 corner: 0.75@1) offsets: (0@ self buttonHeight negated corner: 0@0));
		yourself.
	builder pluggableButtonSpec new
		model: self;
		label: 'cancel';
		action: #cancel;
		frame: (LayoutFrame fractions: (0.75@1 corner: 1@1) offsets: (0@ self buttonHeight negated corner: 0@0));
		yourself}