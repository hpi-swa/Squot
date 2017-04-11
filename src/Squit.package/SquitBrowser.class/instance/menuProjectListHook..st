toolbuilder
menuProjectListHook: aMenu
	<menuProjectList>
	aMenu addList: {
		{'Add project'. #actionProjectAdd. ''}.
		{'Remove project'. #actionProjectRemove. ''}.
		{'Add remote'. #actionRemoteAdd. ''}.
		{'Remove remote'. #actionRemoteRemove. ''}
	}.
	^ aMenu