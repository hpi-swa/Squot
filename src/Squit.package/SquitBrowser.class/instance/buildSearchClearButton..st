toolbuilder
buildSearchClearButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Clear';
		action: #actionClearSearch;
		help: '';
		frame: (0.9@0 corner: 1@1)