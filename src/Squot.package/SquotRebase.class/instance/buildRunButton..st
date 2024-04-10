toolbuilder
buildRunButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionRun;
		label: #runLabel;
		help: 'Run the next operation.';
		yourself