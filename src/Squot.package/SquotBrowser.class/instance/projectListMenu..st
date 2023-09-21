menu
projectListMenu: aMenu
	self activeWorkingCopy ifNotNil: [
		aMenu
			target: self;
			add: 'remove this project' action: #actionRemoveActiveProject;
			add: 'manage remotes'
			target: SquotRemotesBrowser
			selector: #openOnWorkingCopy:
			argument: self activeWorkingCopy].
	aMenu
		target: self;
		add: 'new project' action: #actionNewProject;
		add: 'clone project' action: #actionCloneProject.
	self addMappersProjectListMenu: aMenu.
	^ aMenu