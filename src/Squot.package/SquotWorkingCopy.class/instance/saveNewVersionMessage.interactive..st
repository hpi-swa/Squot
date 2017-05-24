creating new versions
saveNewVersionMessage: aString interactive: shouldBeInteractiveBoolean
	"Create a new version and update my historian.
	If interactive, let the user review and edit the set of changes to be included
	in the new snapshot."
	| finalSnapshot newVersion |
	shouldBeInteractiveBoolean
		ifTrue: [^ self saveNewVersionInteractively]
		ifFalse: [finalSnapshot := store captureSnapshot].
	finalSnapshot ifNil: [^ self].
	newVersion := loadedHistorian createNewVersion: finalSnapshot
		with: [:version | version message: aString].
	self loadedVersion: newVersion.