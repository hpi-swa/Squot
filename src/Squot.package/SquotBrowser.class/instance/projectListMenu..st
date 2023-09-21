menu
projectListMenu: aMenu
	aMenu
		target: self;
		add: 'new project' action: #actionNewProject;
		add: 'clone project' action: #actionCloneProject.
	self addMappersProjectListMenu: aMenu.
	^ aMenu