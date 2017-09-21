creating new versions
saveNewVersionMessage: aString interactive: shouldBeInteractiveBoolean
	"Create a new version and update my historian.
	If interactive, let the user review and edit the set of changes to be included
	in the new snapshot."
	| newVersion patch capturedArtifacts |
	shouldBeInteractiveBoolean ifTrue: [^ self saveNewVersionInteractivelyIfCanceled: []].
	patch := self currentSnapshot patchRelativeToBase: self baseSnapshot.
	[[newVersion := loadedHistorian createNewVersionFromPatch: patch
		with: [:version | version message: aString]]
	on: SquotPathChanged doAndResume: [:changed |
		store moveObjectAt: changed previousPath to: changed newPath]]
	on: SquotArtifactsWereCaptured doAndResume: [:captured |
		capturedArtifacts := captured artifacts].
	self loadedVersion: newVersion.
	self cacheSavedArtifacts: (capturedArtifacts ifNil: [Dictionary new]).