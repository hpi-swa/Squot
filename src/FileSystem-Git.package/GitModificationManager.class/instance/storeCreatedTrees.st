operations
storeCreatedTrees
	createdPaths keysDo: [ :path | self storeTreeAt: path].
	"(createdPaths associations sorted: [ :assoc1 :assoc2 |
		assoc2 value maxSize <= assoc1 value maxSize ]) do: [ :assoc |
			self storeTreeAt: assoc key]."