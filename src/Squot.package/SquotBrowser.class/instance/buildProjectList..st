toolbuilder
buildProjectList: builder
	^ builder pluggableListSpec new
		model: self;
		list: #projectList;
		getSelected: #activeProject;
		setSelected: #activeProject:;
		yourself
