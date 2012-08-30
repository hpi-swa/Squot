accessing
mapAll: aKeyedCollection
	aKeyedCollection associations do: [ :assoc | 
		treeMap 
			at: assoc key
			ifAbsentPut: [ assoc value ] ]