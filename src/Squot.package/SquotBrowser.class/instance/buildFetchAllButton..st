toolbuilder
buildFetchAllButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionFetchAll;
		label: 'Fetch all';
		help: 'Fetch from all remotes.';
		yourself