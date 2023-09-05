toolbuilder
buildNothingSelected: builder
	^ builder pluggableTextSpec new
		model: ('Nothing selected' asText
					addAttribute: TextEmphasis italic;
					yourself);
		getText: #yourself;
		frame: LayoutFrame fullFrame;
		yourself