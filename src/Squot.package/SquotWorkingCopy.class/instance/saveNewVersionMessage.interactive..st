creating new versions
saveNewVersionMessage: aString interactive: shouldBeInteractiveBoolean
	"Create a new version and update my historian.
	If interactive, let the user review and edit the set of changes to be included
	in the new snapshot."
	| newVersion |
	shouldBeInteractiveBoolean ifTrue: [^ self saveNewVersionInteractively].
	newVersion := loadedHistorian createNewVersion: self currentSnapshot
		with: [:version | version message: aString].
	self loadedVersion: newVersion.