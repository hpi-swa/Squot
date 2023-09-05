toolbuilder
buildChangesTree: builder
	^ builder pluggableTreeSpec new
		model: self;
		roots: #rootParts;
		hasChildren: #partHasChildren:;
		getChildren: #partChildren:;
		getSelected: #selectedChangePart;
		setSelected: #selectedChangePart:;
		frame: LayoutFrame fullFrame;
		yourself