initialize-release
shouldVisit: markedCommit1 before: markedCommit2
	^ markedCommit1 object committer timeStamp > markedCommit2 object committer timeStamp