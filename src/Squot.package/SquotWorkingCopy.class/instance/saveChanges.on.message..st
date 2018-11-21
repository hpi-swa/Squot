private switching historians
saveChanges: aPatch on: stashHistorian message: aString
	"Create a new version on the given historian.
	The given historian is modified to equal the loaded historian prior to saving the new version.
	Do not use this if the given historian has unique versions that are relevant to you!"
	| fromHistorian |
	fromHistorian := self loadedHistorian.
	stashHistorian version: fromHistorian version.
	self loadedHistorian: stashHistorian.
	[^ self saveNewVersionMessage: aString interactive: false]
	ensure: [self loadedHistorian: fromHistorian].