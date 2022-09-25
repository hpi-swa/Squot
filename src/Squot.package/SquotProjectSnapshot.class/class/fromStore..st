instance creation
fromStore: aProjectStore
	^ self new
		readProjectFromStore: aProjectStore;
		yourself