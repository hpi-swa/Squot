ui menu
menuObjectListGeneral: aMenu
	<menuObjectList>
	<menuPriority: 999>
	| selected |
	selected := self objectSelection.
	selected ifNotNil: 
		[(self projectSelection artifactAt: selected artifact path ifAbsent: []) ifNil:
			[aMenu addTitle: '(not in working copy)'].
		aMenu addTitle: selected printString].
	self buildMenu: aMenu from: {
		'-'.
		{'Add or remove packages'. #actionAddOrRemoveTrackedPackages. 'Add or remove packages for this project.'. self hasProjectSelection}.
	}.
	^ aMenu