private
liveArtifactFor: anObject at: aPath

	aPath = SquotFilesArtifact path ifTrue: 
		[^ (SquotLiveFilesArtifact new
			objectContainer: self;
			yourself)].
	^ (SquotLiveArtifact on: anObject at: aPath in: self)
		storeInfo: (additionalInfo at: aPath);
		yourself