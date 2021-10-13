toolbuilder
buildObjectList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #objectList;
		getIndex: #objectIndex;
		setIndex: #objectIndex:;
		dragItem: #dragFromObjectList:;
		dropAccept: #wantsObjectListDrop:type:from:;
		dropItem: #dropOnObjectList:at:copyIndicated:;
		frame: (0.7@0.6 corner: 1@1)