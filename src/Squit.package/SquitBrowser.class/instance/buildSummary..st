toolbuilder
buildSummary: builder
	^ builder pluggableTextSpec new
		model: self;
		getText: #contents;
		readOnly: true;
		indicateUnacceptedChanges: false;
		menu: #codePaneMenu:shifted:;
		frame: (0@0.6 corner: 0.7@1)