toolbuilder
buildBranchList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #branchList;
		getIndex: #branchIndex;
		setIndex: #branchIndex:;
		menu: #branchListMenu:;
		frame: (LayoutFrame fractions: (0@0.5 corner: 1@1))