as yet unclassified
acceptButton: builder	
	^ builder pluggableButtonSpec new
		model: thisContext sender receiver;
		label: 'accept' translated;
		action: #accept;
		yourself