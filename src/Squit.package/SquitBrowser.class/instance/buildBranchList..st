toolbuilder
buildBranchList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #branchList;
		getSelected: #branchSelection;
		setSelected: #branchSelection:;
		menu: #branchListMenu:shifted:;
		icon: #branchListIconAt:;
		frame: (LayoutFrame fractions: (0@0.5 corner: 1@1))