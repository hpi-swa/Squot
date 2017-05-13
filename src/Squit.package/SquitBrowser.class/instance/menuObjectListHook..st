ui menu
menuObjectListHook: aMenu
	<menuObjectList>
	aMenu addList: {
		{'Browse edition in selected version'. #actionObjectBrowse. 'Try to open '}.
	}.
	self objectSelection ifNotNil: [:selected |
		(self projectSelection includesObjectAt: selected artifact path) ifTrue:
			[aMenu addList: {
				{'Browse loaded'. #actionObjectBrowseLoaded. 'Try to open the loaded edition of the selected object'}.
			}]].
	aMenu addList: {
		{'Explore'. #actionObjectExplore. 'Explore internal SquotArtifact object.'}.
	}.
	^ aMenu