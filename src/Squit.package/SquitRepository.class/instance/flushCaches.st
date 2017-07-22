accessing
flushCaches
	versionsCache removeAll.
	filesystemsCache removeAll.
	gitRepository flushCaches.
	cachedSnapshots := nil.