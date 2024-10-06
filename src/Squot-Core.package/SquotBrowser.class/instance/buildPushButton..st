toolbuilder
buildPushButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionPush;
		label: 'Push';
		help: 'Push the active ref to a remote.';
		yourself