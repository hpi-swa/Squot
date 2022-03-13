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
		setSelectedPath: #selectedNodePath:;
		getChildren: #childNodesOf:;
		hasChildren: #hasChildren:;
		keyPress: #diffKey:from:event:;
		menu: #diffNodeMenu:shifted:;
		frame: (0@0 corner: 0.4@1);
		yourself.
	builder pluggableTextSpec new
		name: 'diff text for selected item';
		model: self;
		getText: #diffText;
		frame: (LayoutFrame fractions: (0.4@0 corner: 1@1) offsets: (0 @ 0 corner: 0 @ self defaultAnnotationPaneHeight negated));
		yourself.
	builder pluggableTextSpec new
		name: #annotationPane;
		model: self;
		getText: #annotation;
		frame: (LayoutFrame fractions: (0.4@1 corner: 1@1) offsets: (0 @ self defaultAnnotationPaneHeight negated corner: 0 @ 0));
		yourself}