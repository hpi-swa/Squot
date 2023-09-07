toolbuilder
buildCommitButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionCommit;
		label: 'Commit';
		yourself