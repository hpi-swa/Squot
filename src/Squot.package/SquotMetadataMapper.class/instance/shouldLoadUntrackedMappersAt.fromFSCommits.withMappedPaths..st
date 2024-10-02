metadata-loading
shouldLoadUntrackedMappersAt: aPath fromFSCommits: fsCommitsCollection withMappedPaths: mappedPathsCollection
	^ (SquotPathUtilities path: aPath collidesWithAnyOf: mappedPathsCollection)
		or: [(self allHexHashesAt: aPath equalInFSCommits: fsCommitsCollection) not]