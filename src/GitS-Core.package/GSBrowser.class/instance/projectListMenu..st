menu
projectListMenu: aMenu
	self activeWorkingCopy ifNotNil: [
		aMenu
			target: self;
			add: 'Rename this project' action: #actionRenameActiveProject;
			add: 'Choose new repository location' action: #actionChooseNewRepositoryLocationForActiveProject;
			add: 'Remove this project' action: #actionRemoveActiveProject;
			add: 'Manage remotes'
			target: GSRemotesBrowser
			selector: #openOnWorkingCopy:
			argument: self activeWorkingCopy;
			add: 'Export this project to a .sar' action: #actionExportActiveProjectToSar].
	self addMappersProjectListMenu: aMenu.
	aMenu items ifNotEmpty: [aMenu addLine].
	aMenu
		target: self;
		add: 'New project' action: #actionNewProject;
		add: 'Clone project' action: #actionCloneProject.
	^ aMenu