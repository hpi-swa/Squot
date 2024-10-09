toolbuilder
buildOtherButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionOther;
		label: '...';
		help: 'Open a menu to perform other tasks.';
		yourself