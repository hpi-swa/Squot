ui toolbuilder
widgetSpecs: builder
	^{self buildDiffPane: builder.
	builder pluggableTextSpec new
		name: 'message for the new version';
		model: self;
		getText: #message;
		setText: #message:;
		editText: #message:;
		frame: (LayoutFrame fractions: (0@0.7 corner: 0.8@1) offsets: (0@0 corner: 0@(self buttonHeight negated)));
		in: [:textSpec |
			(textSpec respondsTo: #plainTextOnly:) ifTrue: ">= Squeak 6.0"
				[textSpec plainTextOnly: true]];
		yourself.
	self buildCoAuthorSelector: builder.
	self buildButtonBar: builder}