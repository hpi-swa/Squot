toolbuilder
buildEditRemoteButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionEditRemote;
		enabled: #hasSelectedRemote;
		label: 'Edit remote';
		yourself