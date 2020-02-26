class initialization
initializeRegistry
	Registry := WeakKeyDictionary new.
	WeakArray addWeakDependent: Registry. 