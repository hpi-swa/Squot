ui menu
menuProjectListWorkingCopyHook: aMenu
	<menuProjectList>
	<menuPriority: 50>
	self projectSelection ifNil: [^ aMenu].
	aMenu addTitle: 'Working copy of ', self projectSelection name.
	aMenu addList: {
		{'Rename project'. #actionProjectRename}.
		{'Remove project'. #actionProjectRemove}.
	}.
	aMenu addLine.
	aMenu
		addList: {
			{'Add or remove packages'. #actionAddOrRemoveTrackedPackages. 'Add or remove packages for this project.'}
		};
		add: 'Set package storage format...'
		subMenu: (ToolBuilder default build: self packageFormatMenuSpec).
	aMenu addLine.
	aMenu addList: {
		{'Add remote'. #actionRemoteAdd}.
		{'Manage remotes'. #actionManageRemotes}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Edit credentials for project'. #actionCredentialsEdit}.
		{'Edit project-level git user name/email'. #actionGitUserEdit}
	}.
	aMenu addLine.
	aMenu addList: {
		{'Browse working copy'. #actionBrowseWorkingCopy}.
		{'Explore SquotWorkingCopy'. #actionSquotWorkingCopyExplore}.
	};
		addLine.
	^ aMenu