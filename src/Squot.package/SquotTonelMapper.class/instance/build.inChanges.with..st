as yet unclassified
build: anOperation inChanges: aCollection with: builder
	^ builder pluggableTextSpec new
		model: (self operationText: anOperation);
		getText: #yourself;
		frame: LayoutFrame fullFrame;
		yourself