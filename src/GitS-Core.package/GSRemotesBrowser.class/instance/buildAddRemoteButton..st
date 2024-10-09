toolbuilder
buildAddRemoteButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionAddRemote;
		label: 'Add remote';
		yourself