toolbuilder
buildRemoveButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionRemove;
		label: 'Remove Asset';
		yourself