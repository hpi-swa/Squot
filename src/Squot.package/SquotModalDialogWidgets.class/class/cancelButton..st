as yet unclassified
cancelButton: builder
	^ builder pluggableButtonSpec new
		model: thisContext sender receiver;
		label: 'cancel' translated;
		action: #cancel;
		yourself