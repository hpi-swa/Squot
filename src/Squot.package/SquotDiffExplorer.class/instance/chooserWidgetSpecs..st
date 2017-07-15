ui toolbuilder
chooserWidgetSpecs: builder
	^ {builder pluggableTreeSpec new
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
		frame: (0@0 corner: 0.4@1);
		yourself.
	builder pluggableTextSpec new
		name: 'diff text for selected item';
		model: self;
		getText: #diffText;
		frame: (0.4@0 corner: 1@1);
		yourself}