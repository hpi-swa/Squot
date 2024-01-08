toolbuilder
buildChangeOperationButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionChangeOperation;
		label: 'Change';
		help: 'Change the operation type of the active operation.';
		yourself