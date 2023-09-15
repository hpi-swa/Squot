accessing
activeCommit: aCommit
	activeCommit := aCommit.
	self
		changed: #activeCommit;
		changed: #activeCommitInfo.