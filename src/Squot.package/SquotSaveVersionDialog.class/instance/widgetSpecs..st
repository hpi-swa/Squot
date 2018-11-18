ui toolbuilder
widgetSpecs: builder
	^{self buildDiffPane: builder.
	builder pluggableTextSpec new
		name: 'message for the new version';
		model: self;
		getText: #message;
		setText: #message:;
		frame: (LayoutFrame fractions: (0@0.7 corner: 1@1) offsets: (0@0 corner: 0@(-25)));
		yourself.
	self buildButtonBar: builder}