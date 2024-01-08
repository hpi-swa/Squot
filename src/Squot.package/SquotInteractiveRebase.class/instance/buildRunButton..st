toolbuilder
buildRunButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionRun;
		label: 'Run';
		help: 'Run the next operation.';
		yourself