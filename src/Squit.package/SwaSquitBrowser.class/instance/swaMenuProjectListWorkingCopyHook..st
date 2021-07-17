as yet unclassified
swaMenuProjectListWorkingCopyHook: aMenu
	<swaMenuProjectList>
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
		}.
	aMenu addLine.
	aMenu addList: {
		{'Edit credentials for project'. #actionCredentialsEdit}.
		{'Edit project-level git user name/email'. #actionGitUserEdit}
	}.
	^ aMenu