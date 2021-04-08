reflection
reflect: aCollectionElement removeFrom: aDictionary
	"Remove the reference from the object."
	(aDictionary at: aCollectionElement target key ifAbsent: []) = aCollectionElement target value
		ifTrue: [aDictionary removeKey: aCollectionElement target key]
		