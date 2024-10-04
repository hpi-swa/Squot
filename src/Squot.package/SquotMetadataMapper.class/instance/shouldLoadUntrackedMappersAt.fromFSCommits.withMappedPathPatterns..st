metadata-loading
shouldLoadUntrackedMappersAt: aPath fromFSCommits: fsCommitsCollection withMappedPathPatterns: mappedPathPatternsCollection
	^ (mappedPathPatternsCollection anySatisfy: [:each | each matches: aPath])
		or: [(self allHexHashesAt: aPath equalInFSCommits: fsCommitsCollection) not]