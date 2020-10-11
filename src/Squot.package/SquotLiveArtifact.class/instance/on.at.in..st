initialize-release
on: anObject at: aPath in: aStore
	self deprecated: 'Use #setObject:path:store: instead.'.
	object := anObject.
	path := aPath.
	store := aStore.