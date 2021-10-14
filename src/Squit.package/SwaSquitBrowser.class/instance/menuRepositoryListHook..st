ui menu
menuRepositoryListHook: aMenu
	<menuRepositoryList>
	<menuPriority: 50>
	self selectedRepository ifNil: [^ aMenu].
	aMenu addList: {
		{'Remove repository'. #actionRepositoryRemove}.
		{'Add or remove packages'. #actionAddOrRemoveTrackedPackages. 'Add or remove packages for this repository.'}.
		{'Edit credentials for repository'. #actionCredentialsEdit}.
	}.

	^ aMenu