private
liveObjectFor: anObject at: aPath
	^ (SquotLiveObject on: anObject at: aPath in: self)
		storeInfo: (additionalInfo at: aPath);
		yourself