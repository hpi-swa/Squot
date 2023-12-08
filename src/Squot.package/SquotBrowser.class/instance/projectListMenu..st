menu
projectListMenu: aMenu
	self activeWorkingCopy ifNotNil: [
		aMenu
			target: self;
			add: 'Rename this project' action: #actionRenameActiveProject;
			add: 'Remove this project' action: #actionRemoveActiveProject;
			add: 'Manage remotes'
			target: SquotRemotesBrowser
			selector: #openOnWorkingCopy:
			argument: self activeWorkingCopy].
	self addMappersProjectListMenu: aMenu.
	aMenu items ifNotEmpty: [aMenu addLine].
	aMenu
		target: self;
		add: 'New project' action: #actionNewProject;
		add: 'Clone project' action: #actionCloneProject.
	^ aMenu