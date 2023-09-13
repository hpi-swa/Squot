toolbuilder
buildText: aNumber with: builder
	^ builder pluggableTextSpec new
		model: (self indexedModel: aNumber);
		getText: #text;
		setText: #saveText:notifying:;
		help: (self helpFor: aNumber);
		stylerClass: (self stylerClassFor: aNumber);
		verticalResizing: (self verticalResizingFor: aNumber);
		yourself