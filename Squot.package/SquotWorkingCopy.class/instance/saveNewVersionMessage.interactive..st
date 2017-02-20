creating new versions
saveNewVersionMessage: aString interactive: shouldBeInteractiveBoolean
	"Create a new version and update my historian.
	If interactive, let the user review and edit the set of changes to be included
	in the new snapshot."
	| finalSnapshot |
	shouldBeInteractiveBoolean
		ifTrue: [^ self saveNewVersionInteractively]
		ifFalse: [finalSnapshot := store captureSnapshot].
	finalSnapshot ifNil: [^ self].
	self halt.
	loadedHistorian createNewVersion: finalSnapshot
		with: [:version | version message: aString].
	self flag: 'TODO: let the store (SnapshotBuilder) and repository cooperate to save some processing time'.