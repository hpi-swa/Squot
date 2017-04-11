toolbuilder
buildProjectList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #projectList;
		getIndex: #projectIndex;
		setIndex: #projectIndex:;
		menu: #projectListMenu:;
		frame: (0@0 corner: 0.2@0.3)