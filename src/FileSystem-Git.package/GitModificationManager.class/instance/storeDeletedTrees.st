operations
storeDeletedTrees
	"store the changed trees"
	deletedPaths keysDo: [ :path | self storeTreeAt: path].