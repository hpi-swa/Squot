creating new versions
saveNewVersionMessage: aString interactive: shouldBeInteractiveBoolean
	"Create a new version and update my historian.
	If interactive, let the user review and edit the set of changes to be included
	in the new snapshot."
	| newVersion snapshot |
	shouldBeInteractiveBoolean ifTrue: [^ self saveNewVersionInteractivelyIfCanceled: []].
	snapshot := self currentSnapshot.
	newVersion := loadedHistorian createNewVersion: snapshot
		with: [:version | version message: aString].
	self loadedVersion: newVersion.
	self cacheSavedArtifacts: snapshot artifacts.