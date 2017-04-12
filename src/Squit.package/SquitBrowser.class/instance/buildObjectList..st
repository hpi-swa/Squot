toolbuilder
buildObjectList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #objectList;
		getIndex: #objectIndex;
		setIndex: #objectIndex:;
		menu: #objectListMenu:;
		frame: (0.7@0.6 corner: 1@1)