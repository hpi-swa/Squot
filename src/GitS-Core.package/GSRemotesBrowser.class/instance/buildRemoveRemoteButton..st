toolbuilder
buildRemoveRemoteButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionRemoveRemote;
		enabled: #hasSelectedRemote;
		label: 'Remove remote';
		yourself