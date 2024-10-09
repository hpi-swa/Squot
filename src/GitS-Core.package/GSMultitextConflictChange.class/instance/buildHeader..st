toolbuilder
buildHeader: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #headerText;
		verticalResizing: #shrinkWrap;
		readOnly: true;
		yourself