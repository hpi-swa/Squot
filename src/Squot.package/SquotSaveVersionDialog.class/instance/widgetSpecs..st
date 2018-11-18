ui toolbuilder
widgetSpecs: builder
	^{builder pluggableTreeSpec new
		name: 'hierarchical diff';
		model: self;
		nodeClass: SquotDiffNodeTreeWrapper;
		roots: #rootNodes;
		label: #nodeLabelOf:;
		getSelected: #selectedNode;
		setSelected: #selectNode:;
		getChildren: #childNodesOf:;
		hasChildren: #hasChildren:;
		menu: #diffNodeMenu:shifted:;
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