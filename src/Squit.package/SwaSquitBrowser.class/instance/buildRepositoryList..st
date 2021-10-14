toolbuilder
buildRepositoryList: aBuilder

	^ aBuilder pluggableListSpec new
		model: self;
		list: #repositoryList;
		getIndex: #repositoryListIndex;
		setIndex: #repositoryListIndex:;
		hScrollBarPolicy: #never;
		menu: #repositoryListMenu:;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 0.3 offset: 0;
			bottomFraction: 1 offset: self buttonHeight negated)