accessing
artifacts
	| artifactsDictionary |
	artifactsDictionary := Dictionary new.
	self objectsWithPathsDo: [:each :path |
		artifactsDictionary at: path put: (self liveArtifactFor: each at: path)].
	^ artifactsDictionary