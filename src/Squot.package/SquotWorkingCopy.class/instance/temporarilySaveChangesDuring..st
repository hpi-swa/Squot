loading and unloading
temporarilySaveChangesDuring: aBlock
	"Create a temporary version that saves all unsaved changes on the lastLoadedHistorian,
	perform aBlock and go back to the original historian without the temp version."
	| previouslyLoadedHistorian previousAdditionalParents |
	previouslyLoadedHistorian := loadedHistorian.
	previousAdditionalParents := additionalParents.
	[loadedHistorian := self lastLoadedHistorian.
	self withCurrentSnapshot:
	[self saveNewVersionMessage: 'temporary version with unsaved changes' interactive: false.
	aBlock value]]
	ensure:
		[loadedHistorian := previouslyLoadedHistorian.
		additionalParents := previousAdditionalParents].