private
liveObjectFor: anObject at: aPath
	| metadata |
	self flag: #duplication. "with store:at:in:"
	metadata := (additionalInfo at: aPath) copy.
	anObject squotRemoveTransientStoreInfoFrom: metadata.
	^ (SquotLiveObject on: anObject at: aPath)
		storeInfo: metadata;
		yourself