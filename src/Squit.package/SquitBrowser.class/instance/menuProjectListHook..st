ui menu
menuProjectListHook: aMenu
	<menuProjectList>
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
		{'Add project'. #actionProjectAdd}.
		{'Rename project'. #actionProjectRename}.
		{'Remove project'. #actionProjectRemove}.
	}.
	^ aMenu