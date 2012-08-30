helpers
createSomeTreeEntries
	^ self createSomeBlobs collect: [ :blob |
		GitTreeEntry
			fileNamed: blob bytes asString
			hash: blob hash ]
	