accessing
flushCaches
	self initializeCaches.
	objectStores do: [:each | each flushCaches].
	refStores do: [:each | each flushCaches].