ui menu
menuObjectListHook: aMenu
	<menuObjectList>
	| isLoaded |
	aMenu addList: {
		{'Browse edition in selected version'. #actionObjectBrowse. 'Try to open '}.
	}.
	self objectSelection ifNotNil: [:selected |
		isLoaded := self projectSelection includesObjectAt: selected artifact path.
		isLoaded ifTrue:
			[aMenu addList: {
				{'Browse loaded'. #actionObjectBrowseLoaded. 'Try to open the loaded edition of the selected object'}.
			}].
		selected artifact isLoadable ifTrue:
			[aMenu addList: {
				{'Checkout'. #actionObjectCheckout. 'Checkout the edition of this object from the selected version, possibly overwriting uncommitted changes. You will be able to select from a diff what will be checked out.'}.
			}.
			isLoaded ifTrue:
				[aMenu	addList: {
					{'Merge'. #actionObjectMerge. 'Merge the edition of this object from the selected version with the edition that is currently loaded.'}.
				}]].
		isLoaded ifTrue:
			[(self projectSelection objectAt: selected artifact path)
				squitBrowserSupplementObjectMenu: aMenu]].
	aMenu addList: {
		{'Explore'. #actionObjectExplore. 'Explore internal SquotArtifact object.'}.
	}.
	^ aMenu