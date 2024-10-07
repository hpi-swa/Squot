changes-creation
changeSetsToMergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	^ self metadataMapper
		changeSetsToMergeFSCommit: rightFSCommit
		into: leftFSCommit
		withBase: baseFSCommit
		in: self