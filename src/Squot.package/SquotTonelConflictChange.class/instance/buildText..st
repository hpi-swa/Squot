toolbuilder
buildText: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #text;
		setText: #saveText:;
		yourself