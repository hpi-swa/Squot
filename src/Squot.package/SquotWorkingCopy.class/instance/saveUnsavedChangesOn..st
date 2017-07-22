switching historians
saveUnsavedChangesOn: stashHistorian
	"Create a new version on a temporary historian, return the old version of that temporary historian."
	| fromHistorian previousStashedVersion |
	fromHistorian := self loadedHistorian.
	previousStashedVersion := stashHistorian version.
	stashHistorian version: fromHistorian version.
	self loadedHistorian: stashHistorian.
	UIManager default informUser: 'Stashing unsaved changes' during:
	[self saveNewVersionMessage: 'WIP on ', fromHistorian shortName
		interactive: false].
	self loadedHistorian: fromHistorian.
	^ previousStashedVersion