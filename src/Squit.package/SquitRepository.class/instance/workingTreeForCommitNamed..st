Squit internal
workingTreeForCommitNamed: hexHash
	"Answer a GitFilesystem for the version with the given hash.
	Try to reuse an existing if available because it might already have a filled cache."
	| fresh cached |
	fresh := gitRepository commitNamed: hexHash.
	cached := filesystemsCache at: hexHash ifAbsentPut: [fresh].
	leastRecentlyRequestedFilesystems
		"move to the end of the list"
		remove: hexHash ifAbsent: [];
		addLast: hexHash.
	leastRecentlyRequestedFilesystems size > 5 ifTrue:
		[filesystemsCache removeKey: leastRecentlyRequestedFilesystems removeFirst
			ifAbsent: []].
	^ cached = fresh ifTrue: [cached] ifFalse: [fresh]