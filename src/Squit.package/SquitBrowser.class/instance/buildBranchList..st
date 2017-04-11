toolbuilder
buildBranchList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #branchList;
		getIndex: #branchIndex;
		setIndex: #branchIndex:;
		menu: #fieldListMenu:;
		frame: (0@0.3 corner: 0.2@0.6)