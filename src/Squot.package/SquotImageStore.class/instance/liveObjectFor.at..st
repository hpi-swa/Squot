private
liveObjectFor: anObject at: aPath
	| metadata |
	metadata := (additionalInfo at: aPath) copy.
	^ (SquotLiveObject on: anObject at: aPath)
		storeInfo: metadata;
		yourself