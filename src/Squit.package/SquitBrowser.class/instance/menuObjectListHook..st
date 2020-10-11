ui menu
menuObjectListHook: aMenu
	<menuObjectList>
	| selected onlyWhenSelected onlyWhenLoaded onlyWhenLoadable commands |
	selected := self objectSelection.
	onlyWhenSelected := selected notNil.
	onlyWhenLoaded := onlyWhenSelected and:
		[ | artifact |
		artifact := self projectSelection artifactAt: selected artifact path ifAbsent: [].
		artifact ifNil: [false] ifNotNil: [artifact isLoaded]].
	onlyWhenLoadable := onlyWhenSelected and: [selected artifact isLoadable].
	onlyWhenSelected ifTrue:
		[aMenu addTitle: selected printString, String cr,
			(onlyWhenLoaded
				ifTrue: [(self projectSelection objectAt: selected artifact path) printString]
				ifFalse: ['(not loaded)']).
		commands := {
			{'Browse edition in selected version'. #actionObjectBrowse. 'Try to open '}.
			{'Browse loaded'. #actionObjectBrowseLoaded. 'Try to open the loaded edition of the selected object'. onlyWhenLoaded}.
			{'Checkout'. #actionObjectCheckout. 'Checkout the edition of this object from the selected version, possibly overwriting uncommitted changes. You will be able to select from a diff what will be checked out.'. onlyWhenLoadable}.
			{'Merge'. #actionObjectMerge. 'Merge the edition of this object from the selected version with the edition that is currently loaded.'. onlyWhenLoaded}.
		}.
		self buildMenu: aMenu from: commands.
		onlyWhenLoaded ifTrue:
			[(self projectSelection objectAt: selected artifact path)
				squitBrowserSupplementObjectMenu: aMenu].
		self buildMenu: aMenu from: {
			{'Explore'. #actionObjectExplore. 'Explore internal SquotArtifact object.'}.
			'-'.
			{'Untrack'. #actionObjectUntrack. 'Remove this object from the working copy.'. onlyWhenLoaded}
		}].
	self buildMenu: aMenu from: {
		{'Add or remove packages'. #actionAddOrRemoveTrackedPackages. 'Add or remove packages for this project.'}.
	}.
	^ aMenu