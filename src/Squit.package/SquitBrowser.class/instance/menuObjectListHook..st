ui menu
menuObjectListHook: aMenu
	<menuObjectList>
	aMenu addList: {
		{'Browse'. #actionObjectBrowse. 'Try to open '}.
		{'Explore'. #actionObjectExplore. 'Explore internal SquotArtifact object.'}.
	}.
	^ aMenu