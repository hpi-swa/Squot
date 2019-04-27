private
liveArtifactFor: anObject at: aPath

	aPath = LBGitFilesArtifact path ifTrue: 
		[^ (LBGitLiveFilesArtifact new
			ownerSnapshot: self;
			yourself)].
	^ (SquotLiveArtifact on: anObject at: aPath in: self)
		storeInfo: (additionalInfo at: aPath);
		yourself