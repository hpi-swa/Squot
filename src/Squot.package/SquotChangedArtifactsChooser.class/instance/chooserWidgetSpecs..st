ui toolbuilder
chooserWidgetSpecs: builder
	^ {builder pluggableTreeSpec new
		name: 'list of changed artifacts';
		model: self;
		roots: #changedArtifacts;
		nodeClass: SquotArtifactWrapper;
		getChildren: #changesIn:;
		getSelected: #selection;
		setSelected: #selection:;
		menu: #changedArtifactsMenu:shifted:;
		keyPress: #changedArtifactsKey:from:;
		frame: (0@0 corner: 1@1)}