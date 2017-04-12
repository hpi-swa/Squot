toolbuilder
menuObjectListHook: aMenu
	<menuObjectList>
	aMenu addList: {
		{'Browse'. #actionObjectBrowse. ''}.
		{'Explore'. #actionObjectExplore. ''}.
	}.
	^ aMenu