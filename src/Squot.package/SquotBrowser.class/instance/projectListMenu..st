menu
projectListMenu: aMenu
	self activeWorkingCopy ifNotNil: [
		aMenu
			target: self;
			add: 'Remove this project' action: #actionRemoveActiveProject;
			add: 'Manage remotes'
			target: SquotRemotesBrowser
			selector: #openOnWorkingCopy:
			argument: self activeWorkingCopy].
	aMenu
		target: self;
		add: 'New project' action: #actionNewProject;
		add: 'Clone project' action: #actionCloneProject.
	self addMappersProjectListMenu: aMenu.
	^ aMenu