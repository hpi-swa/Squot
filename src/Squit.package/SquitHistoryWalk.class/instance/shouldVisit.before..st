adapting
shouldVisit: markedVersion1 before: markedVersion2
	^ markedVersion1 object commit committer timeStamp > markedVersion2 object commit committer timeStamp