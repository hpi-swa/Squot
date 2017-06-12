converting
convertHashed: aHashedCollection withItsCopy: copyOfHashedCollection
	| metaobject |
	metaobject := SquotHashedCollectionShadow new.
	convertedObjects at: aHashedCollection put: metaobject.
	self build: metaobject from: (aHashedCollection objectForDataStream: self) andItsCopy: (copyOfHashedCollection objectForDataStream: self).
	^ metaobject