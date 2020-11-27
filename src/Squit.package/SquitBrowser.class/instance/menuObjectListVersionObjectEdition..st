ui menu
menuObjectListVersionObjectEdition: aMenu
	<menuObjectList>
	<menuPriority: 100>
	| selected workingCopyArtifact onlyWhenTracked onlyWhenLoaded onlyWhenLoadable commands |
	selected := self objectSelection ifNil: [^ aMenu].
	workingCopyArtifact := self projectSelection artifactAt: selected artifact path ifAbsent: [].
	onlyWhenTracked := workingCopyArtifact notNil.
	onlyWhenLoaded := onlyWhenTracked and: [workingCopyArtifact isLoaded].
	onlyWhenLoadable := selected artifact isLoadable.
	commands := {
		{'Browse in selected version'. #actionObjectBrowse. 'Try to open the version of the object as it was in the selected commit.'}.
		{'Checkout'. #actionObjectCheckout. 'Checkout the edition of this object from the selected version, possibly overwriting uncommitted changes. You will be able to select from a diff what will be checked out.'. onlyWhenLoadable}.
		{'Merge'. #actionObjectMerge. 'Merge the edition of this object from the selected version with the edition that is currently loaded.'. onlyWhenLoaded}.
		{'Explore'. #actionObjectExplore. 'Explore internal SquotArtifact object.'. selected notNil}.
	}.
	self buildMenu: aMenu from: commands.
	^ aMenu