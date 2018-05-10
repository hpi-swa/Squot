as yet unclassified
buildWith: toolBuilder
	^ toolBuilder build: (toolBuilder pluggableWindowSpec new
		model: self;
		label: 'Squot Object Graph';
		children: {
			toolBuilder pluggableListSpec new
				model: self;
				list: #objectNames;
				getIndex: #selectedIndex;
				setIndex: #selectedIndex:;
				doubleClick: #inspectName;
				name: #objectNames;
				frame: (LayoutFrame fractions: (0@0 corner: 1/2@1));
				yourself.
			toolBuilder pluggableListSpec new
				model: self;
				list: #shadowObjects;
				getIndex: #selectedIndex;
				setIndex: #selectedIndex:;
				doubleClick: #inspectShadow;
				name: #shadowObjects;
				frame: (LayoutFrame fractions: (1/2@0 corner: 4/5@1));
				yourself.
			toolBuilder pluggableListSpec new
				model: self;
				list: #liveObjects;
				getIndex: #selectedIndex;
				setIndex: #selectedIndex:;
				doubleClick: #inspectLiveObject;
				name: #liveObjects;
				frame: (LayoutFrame fractions: (4/5@0 corner: 1@1));
				yourself	})