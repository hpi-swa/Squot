merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| left right base |
	left := self loadAssetFileFrom: leftFSCommit filesystem.
	right := self loadAssetFileFrom: rightFSCommit filesystem.
	base := self loadAssetFileFrom: baseFSCommit filesystem.
	^ self mergeAssetFile: right into: left withBase: base