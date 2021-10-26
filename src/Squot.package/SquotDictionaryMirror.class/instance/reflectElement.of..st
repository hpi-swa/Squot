reflection
reflectElement: aCollectionElement of: aDictionary
	"Answer the Association from aDictionary with the same key as the element's association key."
	^ aDictionary associationAt: aCollectionElement target key