private
updatePath
	| storeInfo |
	storeInfo := artifact storeInfo copy
		at: #path put: artifact path;
		yourself.
	workingCopy repository initializeStoreInfo: storeInfo forObject: artifact content.
	(storeInfo at: #path) ~= artifact path ifTrue:
		[workingCopy moveObjectAt: artifact path to: (storeInfo at: #path)].
	artifact := workingCopy unloadedArtifacts at: (storeInfo at: #path).