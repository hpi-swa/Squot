toolbuilder
menuProjectListHook: aMenu
	<menuProjectList>
	aMenu addList: {
		{'Add remote'. #actionRemoteAdd. ''}.
		{'Remove remote'. #actionRemoteRemove. ''}
	}.
	^ aMenu