converting
convert: anObject withItsCopy: copyOfAnObject
	| metaobject |
	metaobject := SquotMetaobject new.
	convertedObjects at: anObject put: metaobject.
	self build: metaobject from: (anObject objectForDataStream: self) andItsCopy: (copyOfAnObject objectForDataStream: self).
	^ metaobject