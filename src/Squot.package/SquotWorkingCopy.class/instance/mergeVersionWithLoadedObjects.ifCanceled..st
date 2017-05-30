loading and unloading
mergeVersionWithLoadedObjects: aVersion ifCanceled: cancelBlock
	"Create a temporary version that saves all unsaved changes on the lastLoadedHistorian,
	merge it with aVersion and go back to the original historian without the temp version."
	| previouslyLoadedHistorian previousAdditionalParents |
	previouslyLoadedHistorian := loadedHistorian.
	previousAdditionalParents := additionalParents.
	[loadedHistorian := self lastLoadedHistorian.
	self withCurrentSnapshot:
	[self
		saveNewVersionMessage: 'temporary version with unsaved changes' interactive: false;
		mergeVersionInteractively: aVersion ifCanceled: [^ cancelBlock value];	
		loadedVersion: aVersion]]
	ensure:
		[loadedHistorian := previouslyLoadedHistorian.
		additionalParents := previousAdditionalParents].