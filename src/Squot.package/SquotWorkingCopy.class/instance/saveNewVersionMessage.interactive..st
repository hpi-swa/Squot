creating new versions
saveNewVersionMessage: aString interactive: shouldBeInteractiveBoolean
	"Create a new version and update my historian.
	If interactive, let the user review and edit the set of changes to be included
	in the new snapshot."
	| newVersion patch |
	SquotToggles enableRefactoredSave ifTrue:
		[self deprecated: 'Use newSaveOperation or newInteractiveSaveOperation instead'].
	^ repository withUnitOfWork:
		[patch := self patchRelativeToBase: self baseSnapshot.
		shouldBeInteractiveBoolean ifTrue:
			[^ self saveNewVersionFromPatch: patch ifCanceled: []].
		newVersion := self
			saveNewVersionFromPatch: patch
			message: aString.
		newVersion]