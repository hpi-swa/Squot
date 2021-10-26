reflection
removeElement: aCollectionElement from: aDictionary
	^ (aDictionary at: aCollectionElement target key ifAbsent: []) = aCollectionElement target value
		ifTrue: [aDictionary removeKey: aCollectionElement target key]