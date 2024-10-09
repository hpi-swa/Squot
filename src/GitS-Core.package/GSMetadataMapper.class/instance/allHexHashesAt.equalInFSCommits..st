metadata-loading
allHexHashesAt: aPath equalInFSCommits: aCollection
	^ (aCollection collect: [:each | each commit hexHashAtPath: aPath]) asSet size = 1