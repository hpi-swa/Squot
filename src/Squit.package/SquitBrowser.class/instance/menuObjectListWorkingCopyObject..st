ui menu
menuObjectListWorkingCopyObject: aMenu
	<menuObjectList>
	<menuPriority: 300>
	| selected workingCopyArtifact onlyWhenLoaded onlyWhenLoadable commands |
	selected := self objectSelection ifNil: [^ aMenu].
	workingCopyArtifact := self projectSelection artifactAt: selected artifact path ifAbsent: [].
	workingCopyArtifact ifNil: [^ aMenu].
	onlyWhenLoaded := workingCopyArtifact isLoaded.
	onlyWhenLoadable := selected artifact isLoadable.
	aMenu addTitle: 
		(onlyWhenLoaded
			ifTrue: [(self projectSelection objectAt: selected artifact path) printString]
			ifFalse: 	['(not loaded)']).
	commands := {
		'-'.
		{'Browse in working copy'. #actionObjectBrowseInWorkingCopy. 'Try to open the current version of the selected object'}.
	}.
	self buildMenu: aMenu from: commands.
	onlyWhenLoaded ifTrue:
		[(self projectSelection objectAt: selected artifact path)
			squitBrowserSupplementObjectMenu: aMenu].
	self buildMenu: aMenu from: {
		{'Untrack'. #actionObjectUntrack. 'Remove this object from the working copy.'}.
	}.
	^ aMenu