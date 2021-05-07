toolbuilder
buildProjectList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #projectList;
		getIndex: #projectIndex;
		setIndex: #projectIndex:;
		dragItem: #dragFromProjectList:;
		dropAccept: #wantsProjectListDrop:type:from:;
		dropItem: #dropOnProjectList:at:copyIndicated:;
		menu: #projectListMenu:;
		frame: (0@0 corner: 1@0.5)