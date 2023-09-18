toolbuilder
buildFetchAllButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionFetchAll;
		label: 'Fetch All';
		help: 'Fetch from all remotes.';
		yourself