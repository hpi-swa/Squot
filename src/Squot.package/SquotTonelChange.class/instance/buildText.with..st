toolbuilder
buildText: aNumber with: builder
	^ builder pluggableTextSpec new
		model: (self indexedModel: aNumber);
		getText: #text;
		setText: #saveText:notifying:;
		verticalResizing: (self verticalResizingFor: aNumber);
		yourself