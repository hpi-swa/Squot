instance creation
newWithBrowser: aBrowser operations: aCollection
	^ self new
		browser: aBrowser;
		addAll: aCollection;
		yourself