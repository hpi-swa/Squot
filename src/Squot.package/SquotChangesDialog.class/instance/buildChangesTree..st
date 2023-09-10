toolbuilder
buildChangesTree: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #rootNodes;
		hasChildren: #nodeHasChildren:;
		getChildren: #nodeChildren:;
		getSelected: #selectedChange;
		setSelected: #selectedChange:;
		label: #nodeLabel:;
		frame: LayoutFrame fullFrame;
		yourself