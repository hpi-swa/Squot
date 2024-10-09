changes-creation
changeSetToMergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| left right base |
	GSMergeUtilities
		hexHashMerge: [:commit | self hexHashIn: commit]
		left: leftFSCommit
		right: rightFSCommit
		base: baseFSCommit
		ifUnchanged: [^ GSEmptyChangeSet withMapper: self].
	left := self loadAssetFileFrom: leftFSCommit filesystem.
	right := self loadAssetFileFrom: rightFSCommit filesystem.
	base := self loadAssetFileFrom: baseFSCommit filesystem.
	^ self changeSetToMergeAssetFile: right into: left withBase: base