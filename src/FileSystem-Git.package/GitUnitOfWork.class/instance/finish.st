finishing
finish
	objectStores do: [:each | each flushCaches].
	refStores do: [:each | each flushCaches].
	config := nil.
	self initialize.