accessing
refsForCommit: aCommit
	^ self refsForCommits at: aCommit asHexHash ifAbsent: [{}]