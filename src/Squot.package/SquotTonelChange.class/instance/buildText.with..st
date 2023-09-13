toolbuilder
buildText: aNumber with: builder
	^ builder pluggableTextSpec new
		model: (self indexedModel: aNumber);
		getText: #text;
		setText: #saveText:notifying:;
		yourself