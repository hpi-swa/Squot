loading and unloading
mergeVersionWithLoadedObjects: aVersion ifCanceled: cancelBlock
	"Create a temporary version that saves all unsaved changes on the lastLoadedHistorian,
	merge it with aVersion and go back to the original historian without the temp version."
	self temporarilySaveChangesDuring: [
		self mergeVersionInteractively: aVersion ifCanceled: [^ cancelBlock value];	
			loadedVersion: aVersion].