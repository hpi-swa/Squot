toolbuilder
buildWith: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #operationText;
		frame: LayoutFrame fullFrame;
		yourself