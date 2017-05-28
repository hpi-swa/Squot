ui menu
menuProjectListHook: aMenu
	<menuProjectList>
	aMenu addList: {
		{'Add project'. #actionProjectAdd}.
		{'Clone project'. #actionProjectClone}.
		{'Rename project'. #actionProjectRename}.
		{'Remove project'. #actionProjectRemove}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Start tracking packages'. #actionObjectPackageAdd. 'Add new packages to this project.'}.
		{'Stop tracking packages'. #actionObjectPackageRemove. 'Remove packages from this project.'}.
	}.
	aMenu addLine.
	aMenu addList: {
		{'Add remote'. #actionRemoteAdd}.
		{'Remove remote'. #actionRemoteRemove}
	}.
	aMenu addLine.
	aMenu addList: {
		{'Edit credentials for project'. #actionCredentialsEdit}.
		{'Edit project-level git user name/email'. #actionGitUserEdit}
	}.
	aMenu addLine.
	aMenu addList: {
		{'Explore SquotWorkingCopy'. #actionSquotWorkingCopyExplore}.
	}.
	^ aMenu