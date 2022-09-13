toolbuilder
buildSearchBar: builder
	^ builder pluggableInputFieldSpec new
		minimumHeight: 0;
		model: self;
		getText: #searchTerm;
		setText: #searchTerm:;
		indicateUnacceptedChanges: false;
		help: 'Search commits...';
		frame: (LayoutFrame new
			topFraction: 0;
			bottomFraction: 1;
			leftFraction: 0;
			rightFraction: 1 offset: self searchClearButtonWidth negated)