ui menu
menuObjectListHook: aMenu
	<menuObjectList>
	| selected workingCopyArtifact onlyWhenSelected onlyWhenTracked onlyWhenLoaded onlyWhenLoadable commands |
	selected := self objectSelection.
	workingCopyArtifact := self projectSelection artifactAt: selected artifact path ifAbsent: [].
	onlyWhenSelected := selected notNil.
	onlyWhenTracked := onlyWhenSelected and: [workingCopyArtifact notNil].
	onlyWhenLoaded := onlyWhenTracked and: [workingCopyArtifact isLoaded].
	onlyWhenLoadable := onlyWhenSelected and: [selected artifact isLoadable].
	onlyWhenSelected ifTrue:
		[aMenu addTitle: selected printString, String cr,
			(onlyWhenLoaded
				ifTrue: [(self projectSelection objectAt: selected artifact path) printString]
				ifFalse:
					[onlyWhenTracked
						ifTrue: [	'(not loaded)']
						ifFalse: ['(not in working copy)']]).
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
			'-'}
		].
	self buildMenu: aMenu from: {
		{'Untrack'. #actionObjectUntrack. 'Remove this object from the working copy.'. onlyWhenTracked}.
		{'Add or remove packages'. #actionAddOrRemoveTrackedPackages. 'Add or remove packages for this project.'}.
	}.
	^ aMenu