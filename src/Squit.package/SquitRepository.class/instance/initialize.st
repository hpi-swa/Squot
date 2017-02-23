initialize-release
initialize
	versionsCache := WeakValueDictionary new.
	filesystemsCache := Dictionary new.
	leastRecentlyRequestedFilesystems := OrderedCollection new.