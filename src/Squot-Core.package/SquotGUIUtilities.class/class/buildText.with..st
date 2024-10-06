toolbuilder
buildText: aText with: builder
	^ builder pluggableTextSpec new
		model: aText;
		getText: #yourself;
		yourself