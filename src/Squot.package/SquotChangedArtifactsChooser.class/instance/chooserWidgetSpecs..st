ui toolbuilder
chooserWidgetSpecs: builder
	^ {builder pluggableListSpec new
		name: 'list of changed artifacts';
		model: self;
		list: #changedArtifacts;
		getIndex: #selectedIndex;
		setIndex: #selectedIndex:;
		menu: #changedArtifactsMenu:shifted:;
		keyPress: #changedArtifactsKey:from:;
		frame: (LayoutFrame
			fractions: (0@0 corner: 1@1)
			offsets: (0@0 corner: 0@ -25));
		yourself.
	builder pluggableTextSpec new
		name: 'change summary for selected artifact';
		model: self;
		getText: #selectionSummary;
		readOnly: true;
		indicateUnacceptedChanges: false;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 1 offset: -25;
			rightFraction: 1 offset: 0;
			bottomFraction: 1 offset: 0);
		yourself}