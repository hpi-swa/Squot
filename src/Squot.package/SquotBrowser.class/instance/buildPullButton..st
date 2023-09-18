toolbuilder
buildPullButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionPull;
		label: 'Pull';
		help: 'Pull into the head branch.';
		yourself