loading
loadAuthor: aString
	self author: (GitStamp fromString: (self tryDecodeString: aString)).