private
updatePath
	| storeInfo |
	storeInfo := artifact liveStoreInfo copy
		at: #path put: artifact path;
		yourself.
	workingCopy initializeStoreInfo: storeInfo forObject: (workingCopy objectAt: artifact path) shadow: artifact content.
	(storeInfo at: #path) ~= artifact path ifTrue:
		[workingCopy moveObjectAt: artifact path to: (storeInfo at: #path)].
	artifact := workingCopy store artifactAt: (storeInfo at: #path).