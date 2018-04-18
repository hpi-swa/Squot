private
liveArtifactFor: anObject at: aPath
	^ (SquotLiveArtifact on: anObject at: aPath in: self)
		storeInfo: (additionalInfo at: aPath);
		yourself