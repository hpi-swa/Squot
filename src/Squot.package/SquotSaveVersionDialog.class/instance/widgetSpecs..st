ui toolbuilder
widgetSpecs: builder
	^{builder pluggableTreeSpec new
		name: 'Diff';
		model: self;
		nodeClass: SquotDiffNodeTreeWrapper;
		roots: #rootNodes;
		label: #diffTitleOf:;
		"help: #diffTextFor:;"
		getSelectedPath: #diffSelectedPath;
		getSelected: #diffSelectedNode;
		setSelected: #selectNode:;
		getChildren: #diffChildrenOf:;
		hasChildren: #diffHasChildren:;
		menu: #diffTreeMenu:;
		frame: (0@0 corner: 0.4@0.7).
	builder pluggableTextSpec new
		name: 'diff text for selected item';
		model: self;
		getText: #diffText;
		frame: (0.4@0 corner: 1@0.7);
		yourself.
	builder pluggableTextSpec new
		name: 'message for the new version';
		model: self;
		getText: #message;
		setText: #message:;
		frame: (LayoutFrame fractions: (0@0.7 corner: 1@1) offsets: (0@0 corner: 0@(-25)));
		yourself.
	self buildButtonBar: builder}