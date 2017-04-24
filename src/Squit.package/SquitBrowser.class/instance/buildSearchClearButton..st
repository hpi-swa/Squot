toolbuilder
buildSearchClearButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Clear';
		enabled: #hasSearchTerm;
		action: #actionClearSearch;
		help: 'Clear your search.';
		frame: (0.9@0 corner: 1@1)