converting
convert: anObject withItsCopy: copyOfAnObject
	| metaobject |
	metaobject := SquotMetaobject new.
	self build: metaobject from: (anObject objectForDataStream: self) andItsCopy: (copyOfAnObject objectForDataStream: self).
	^ metaobject