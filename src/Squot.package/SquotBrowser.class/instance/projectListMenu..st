menu
projectListMenu: aMenu
	self activeWorkingCopy ifNotNil: [
		aMenu
			target: self;
			add: 'remove this project' action: #actionRemoveActiveProject].
	aMenu
		target: self;
		add: 'new project' action: #actionNewProject;
		add: 'clone project' action: #actionCloneProject.
	self addMappersProjectListMenu: aMenu.
	^ aMenu