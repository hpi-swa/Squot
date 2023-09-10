toolbuilder
buildText: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #operationText;
		setText: #operationText:;
		frame: LayoutFrame fullFrame;
		yourself