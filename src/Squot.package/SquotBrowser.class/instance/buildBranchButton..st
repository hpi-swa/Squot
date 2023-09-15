toolbuilder
buildBranchButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		action: #actionCreateBranchAtActiveCommit;
		label: 'Branch';
		help: 'Create a branch at the active commit.';
		yourself