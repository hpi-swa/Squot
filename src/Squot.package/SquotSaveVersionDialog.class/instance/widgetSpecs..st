ui toolbuilder
widgetSpecs: builder
	^{self buildDiffPane: builder.
	builder pluggableTextSpec new
		name: 'message for the new version';
		model: self;
		getText: #message;
		setText: #message:;
		editText: #message:;
		frame: (LayoutFrame fractions: (0@0.7 corner: 0.8@1) offsets: (0@0 corner: 0@(-25)));
		yourself.
	self buildCoAuthorSelector: builder.
	self buildButtonBar: builder}