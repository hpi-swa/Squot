creating new versions
saveNewVersionMessage: aString interactive: shouldBeInteractiveBoolean
	"Create a new version and update my historian.
	If interactive, let the user review and edit the set of changes to be included
	in the new snapshot."
	shouldBeInteractiveBoolean ifTrue: [self notYetImplemented].
	loadedHistorian createNewVersion: store captureSnapshot
		with: [:version | version message: aString].
	self flag: 'TODO: let the store (SnapshotBuilder) and repository cooperate to save some processing time'.