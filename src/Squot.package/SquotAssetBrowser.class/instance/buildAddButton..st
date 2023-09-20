toolbuilder
buildAddButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionAdd;
		label: 'Add Asset';
		yourself