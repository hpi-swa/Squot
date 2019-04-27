accessing
artifacts
	| artifactsDictionary |
	artifactsDictionary := Dictionary new.
	self objectsWithPathsDo: [:each :path |
		artifactsDictionary at: path put: (self liveArtifactFor: each at: path)].
	artifactsDictionary at: LBGitFilesArtifact path put: 
		(LBGitLiveFilesArtifact new
			ownerSnapshot: self;
			yourself).
	^ artifactsDictionary