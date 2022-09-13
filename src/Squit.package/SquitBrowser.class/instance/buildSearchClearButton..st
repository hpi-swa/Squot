toolbuilder
buildSearchClearButton: builder
	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Clear';
		enabled: #hasSearchTerm;
		action: #actionClearSearch;
		help: 'Clear your search.';
		frame: (LayoutFrame new
			topFraction: 0;
			bottomFraction: 1;
			leftFraction: 1 offset: self searchClearButtonWidth negated;
			rightFraction: 1)