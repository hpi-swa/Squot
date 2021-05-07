objects
hasObject: aHexHash
	^ objectStores anySatisfy: [:each | each hasObject: aHexHash]