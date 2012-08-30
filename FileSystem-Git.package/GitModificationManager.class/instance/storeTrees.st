operations
storeTrees
	storedObjects := Set new.
	self storeCreatedTrees.
	self storeDeletedTrees.
	self rootTree store