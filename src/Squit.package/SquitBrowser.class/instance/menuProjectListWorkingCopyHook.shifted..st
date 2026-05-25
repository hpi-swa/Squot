ui menu
menuProjectListWorkingCopyHook: aMenu shifted: shifted
	<menuProjectList>
	<menuPriority: 50>
	self projectSelection ifNil: [^ aMenu].
	aMenu addTitle: ('Working copy of {1}' format: {self projectSelection name}).
	aMenu add: 'Rename project' action: #actionProjectRename.
	(shifted or: [self projectSelection repository exists not]) ifTrue:
		[aMenu addList: {
			{'Change project directory'. #actionProjectChangeDirectory. 'Assign this project to a different directory. This does NOT move the existing repository to another location.'}
		}].
	aMenu add: 'Remove project' action: #actionProjectRemove.
	aMenu addLine.
	aMenu
		addList: {
			{'Add or remove packages'. #actionAddOrRemoveTrackedPackages. 'Add or remove packages for this project.'}
		};
		add: 'Set package storage format...'
		subMenu: (ToolBuilder default build: self packageFormatMenuSpec).
	aMenu
		addLine;
		addList: {{'Browse tags' translated. #browseTags. 'List tags in the repository of this project' translated}};
		addLine.
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