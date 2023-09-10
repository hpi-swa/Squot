toolbuilder
buildText: aText with: builder
	^ builder pluggableTextSpec new
		model: aText;
		getText: #yourself;
		verticalResizing: #shrinkWrap;
		yourself