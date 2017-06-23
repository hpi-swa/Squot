loading
loadCommitter: aString
	self committer: (GitStamp fromString: (self tryDecodeString: aString))