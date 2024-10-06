toolbuilder
buildCancelButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #close;
		label: 'Cancel';
		yourself