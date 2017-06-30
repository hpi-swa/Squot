loading
loadTagger: aString
	self tagger: (GitStamp fromString: (self tryDecodeString: aString))