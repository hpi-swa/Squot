changes-creation
changeSetsFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	^ self metadataMapper
		changeSetsFromFSCommit: anFSCommit
		toFSCommit: anotherFSCommit
		in: self