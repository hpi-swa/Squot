merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| left right base |
	left := self loadVersionFrom: leftFSCommit filesystem.
	right := self loadVersionFrom: rightFSCommit filesystem.
	base := self loadVersionFrom: baseFSCommit filesystem.
	^ self mergeVersion: right into: left withBase: base