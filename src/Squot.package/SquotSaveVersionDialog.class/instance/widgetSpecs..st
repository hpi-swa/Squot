ui toolbuilder
widgetSpecs: builder
	^{builder pluggablePanelSpec new name: 'changes selector';
		name: 'changes selector';
		model: changeChooser;
		children: (changeChooser chooserWidgetSpecs: builder);
		frame: (0@0 corner: 0.3@0.7);
		yourself.
	builder pluggableTreeSpec new
		name: 'Diff';
		model: self;
		roots: #diffRoots;
		label: #diffTitleOf:;
		getSelectedPath: #diffSelectedPath;
		getSelected: #diffSelectedNode;
		setSelected: #diffSelect:;
		getChildren: #diffChildrenOf:;
		hasChildren: #diffHasChildren:;
		menu: #diffTreeMenu:;
		frame: (0.3@0 corner: 0.6@0.7).
	builder pluggableTextSpec new
		name: 'diff text for selected item';
		model: self;
		getText: #diffText;
		frame: (0.6@0 corner: 1@0.7);
		yourself.
	builder pluggableTextSpec new
		name: 'message for the new version';
		model: self;
		getText: #message;
		setText: #message:;
		frame: (LayoutFrame fractions: (0@0.7 corner: 1@1) offsets: (0@0 corner: 0@(-25)));
		yourself.
	self buildButtonBar: builder}