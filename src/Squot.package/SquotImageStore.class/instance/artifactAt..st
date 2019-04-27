accessing
artifactAt: path

	path = LBGitFilesArtifact path ifTrue: [
		^ (LBGitLiveFilesArtifact new
			ownerSnapshot: self;
			yourself)].
	^ self liveArtifactFor: (self objectAt: path) at: path